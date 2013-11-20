class ArticlesController < ApplicationController
  before_action :get_article, except: [ :index, :create]


  def index
    @articles = Article.includes( :comments, :tags ).all

    # render json: @articles.to_json( include: [:comments, :tags] )
  end

  def create
    if article = Article.create(article_params)
      head :created, location: article_url(article)
    else
      head :unprocessable_entity
    end
  end

  def show
    render json: @article.to_json( include:[:comments, :tags] )
  end

  def update
    if @article.update(article_params)
      head :no_content
    else
      render json: @article.errors, status: :unprocessable_entity
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
      :title, :body, :is_published, :author
    )

  end

end

