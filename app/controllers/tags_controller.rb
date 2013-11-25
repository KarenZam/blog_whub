class TagsController < ApplicationController
  before_action :get_tag, only: [ :update, :destroy ]
  respond_to :json

  def index
    @tags = params[:id] ? Tag.includes( :articles).where('id in (?)', params[:id].split(",")) : Tag.includes( :articles).all
  end

  def create
    if tag = Tag.create(tag_params)
      head :created, location: tag_url(tag)
    else
      head :unprocessable_entity
    end
  end

  def update
    if @tag.update(tag_params)
      head :reser_content
    else
      head :unprocessable_entity
    end
  end

  def destroy
    tag = Tag.where('id = ?', params[:id]).take
    if tag 
      if tag.destroy
        head :no_content
      else
        head :unprocessable_entity
      end
    else
      head :not_found
    end
  end

  private

  def get_tag
    head :not_found unless @tag = Tag.where('id = ?', params[:id]).take
  end

  def tag_params
    params.require(:article).permit(
      :badge
    )
  end

end

