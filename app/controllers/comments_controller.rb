class CommentsController < ActionController::Base

  def index
    article = Article.find_by(id: params[:article_id])
    comments = article.comments

    render json: comments.to_json
  end

  def create

  end

  def show
    @comment = Comment.find_by(id: params[:id])
    
    render json: @comment.to_json
  end

  def update
    
  end

  def destroy
  end
  
end
