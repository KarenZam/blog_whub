class ArticlesController < ApplicationController
  before_action :get_article, except: [ :index, :create]

  respond_to :json

  def index
    @articles = if params[:user_id] && @user = User.includes(:comments).where(params[:user_id]).take
      Article.includes(:comments, :tags).where('id in (?)', @user.comments.map {|c| c.article_id})
    elsif params[:id]
      Article.includes( :comments, :tags).where('id in (?)', params[:id].split(","))
    else
      Article.includes( :comments, :tags).all
    end
  end

  def create
    if article = Article.create(article_params)
      head :created, location: article_url(article)
    else
      head :unprocessable_entity
    end
  end

  def update
    article = Article.where('id=?', params[:id]).take
    if article
      if article.update(article_params)
        head :reset_content
      else
        head :unprocessable_entity
      end
    else
      head :not_found
    end
  end

  def destroy
    @article.destroy
    head :no_content
  end

  private

  def get_article
    head :not_found unless @article = Article.includes( :comments, :tags ).find_by_id( params[:id] ) 
  end

  def article_params
    params.require(:article).permit(
      :title, :body, :is_published, :author, tags_attributes: [:badge]
    )

  end

end

