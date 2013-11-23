object false

child @tags, object_root: false do

  attributes :id, :field

  node :href do |tag|
    tag_url(tag) 
  end

  child :articles do
    attributes :title
    attributes :body
  end

  node :linked do
  {
    tags: tags_url   
  }
  end

end