object false

child @articles, object_root: false do

  attributes :id, :title, :author, :is_published, :body

  node :href do |article|
    article_url(article) 
  end

  child :tags do
    attributes :badge
  end

  child :comments do
    attributes :body
    child :user do
      attributes :name
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