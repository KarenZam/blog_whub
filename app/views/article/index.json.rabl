collection @articles

attributes :id, :title, :author, :is_published, :body, :comments

node :href do |job|
  articles_url(article)
end

