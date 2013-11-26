class CommentsController < ApplicationController
  before_action :get_comment, only: [ :update, :destroy ]
  before_action :get_article
  helper_method :current_user
  before_action :is_authenticated?, only: [ :create ]

  respond_to :json
  
  def index
    @comments = params[:id] ? @article.comments.where('id in (?)', params[:id].split(",")) : @article.comments
  end

  def create
    comment = Comment.new comment_params
    comment.article = @article
    comment.user = current_user
    if comment.save
      head :created
    else
      head :unprocessable_entity
    end
  end

  def update
    if @comment.update(comment_params)
      head :reser_content
    else
      head :unprocessable_entity
    end
  end

  def destroy
    @comment.destroy
    head :no_content
  end

  private

  def comment_params
    params.require(:comment).permit(
      :article, :body, :user
    )
  end

  def get_comment
    head :not_found unless @comment = Comment.where('id = ?', params[:id]).take
  end

  def get_article
    head :not_found unless @article = Article.where('id = ?', params[:article_id]).take 
  end
  
end
