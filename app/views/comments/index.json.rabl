object false

child @comments, object_root: false do

  attributes :id, :body

  node :href do |comment|
    article_comment_url(:article_id, comment) 
  end

  child :user do
    attributes :name
    attributes :id
  end

  node :linked do
  {
    comments: article_comments_url,
    articles: articles_url
  }
  end

  node :links do |comment|
  {
    user: user_url(comment.user)
  }
  end

end