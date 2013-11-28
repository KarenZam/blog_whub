class ArticlesController < ApplicationController
  before_action :get_article, only: [ :update, :destroy ]

  respond_to :json

  def index

    @articles = if params[:user_id] && @user = User.includes(:comments).where(params[:user_id]).take
      Article.includes(:comments, :tags).where('id in (?)', @user.comments.map {|c| c.article_id})
    elsif params[:id]
      Article.includes( :comments, :tags).where('id in (?)', params[:id].split(","))
    else
      if params[:page]
        pagesize = 10
        offset = params[:page].to_i * pagesize
        Article.order(created_at: :desc).offset(offset).take(pagesize)
      else  
        Article.includes( :comments, :tags).order(created_at: :desc).all
      end
    end
  end
  


  def create
    tags_params = params.delete(:tags)
    if article = Article.create(article_params)
      article.find_or_create_tags(tags_params)
      head :created, location: article_url(article)
    else
      head :unprocessable_entity
    end
  end

  def update
    if @article.update(article_params)
      head :reser_content
    else
      head :unprocessable_entity
    end
  end

  def destroy
    article = Article.includes(:tags).where('id = ?', params[:id]).take
    if article 
      article.tags.each do |t|
        t.destroy if t.articles.length == 1
      end

      if article.destroy
        head :no_content
      else
        head :unprocessable_entity
      end
    else
      head :not_found
    end
  end

  private

  def get_article
    head :not_found unless @article = Article.where('id = ?', params[:id]).take
  end

  def article_params
    params.require(:article).permit(
      :title, :body, :is_published, :author, tags_attributes: [:badge]
    )
  end
end

