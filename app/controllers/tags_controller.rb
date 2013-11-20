class TagsController < ApplicationController
  before_action :get_tag, except: [ :index, :create]

  def index
    if :article_id
      article = Article.find_by_id( params[:article_id] ) 
      tags = article.tags
      render json: tags.to_json
    else
      @tags = Tag.includes( :articles ).all
      render json: @tags.to_json(include:[:articles])
    end
    
  end

  def create
    if tag = Tag.create(tag_params)
      head :created, location: tag_url(tag)
    else
      head :unprocessable_entity
    end
  end

  def show
    render json: @tag.to_json(include:[:articles])
  end

  def update
    if @tag.update(tag_params)
      head :no_content
    else
      render json: @tag.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @tag.destroy
    head :no_content
  end

  private

  def get_tag
    head :not_found unless @tag = Tag.includes( :articles ).find_by_id( params[:id] ) 
  end

  def tag_params
    params.require(:article).permit(
      :badge
    )
  end

end

