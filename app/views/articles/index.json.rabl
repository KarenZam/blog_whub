collection @articles

attributes :id, :title, :author, :is_published, :body

node :href do |article|
  article_url(article) 
end

child :tags do
  attributes :badge
end

node :linked do |article|
{
  comments: article_comments_url(article),
  tags: article_tags_url(article)
}


end
