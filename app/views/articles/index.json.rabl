object false


child @articles, object_root: false do

  attributes :id, :title, :author, :is_published, :body, :created_at

  node :href do |article|
    article_url(article) 
  end

  child :tags, object_root: false do
    attributes :badge, :id
  end

  child :comments, object_root: false do
    attributes :body
    child :user, object_root: false do
      attributes :name
      attributes :id
    end
  end

  node :linked do
  {
    articles: articles_url   
  }
  end

  node :links do |article|
  {

    comments: article_comments_url(article),
    tags: article_tags_url(article),
    article: article_url(article)
  }

  end

end

node :meta do
  {
    count: @article_count
  }
end