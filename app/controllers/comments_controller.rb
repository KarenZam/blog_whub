class CommentsController < ActionController::Base
  before_action :get_comment, except: [ :index, :create]
  before_action :get_article

  def index
    comments = @article.comments

    render json: comments.to_json
  end

  def create
    if comment = Comment.create(comment_params)
      head :created, location: article_comment_url(@article, comment)
    else
      head :unprocessable_entity
    end

  end

  def show
    @comment = Comment.find_by(id: params[:id])
    
    render json: @comment.to_json
  end

  def update
    if @comment.update(comment_params)
      head :no_content
    else
      render json: @comment.errors, status: :unprocessable_entity
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
    head :not_found unless @comment = Comment.find_by_id( params[:id] ) 
  end

  def get_article
    head :not_found unless @article = Article.includes( :comments ).find_by_id( params[:article_id] ) 
  end
  
end
