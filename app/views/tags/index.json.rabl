object false

child @tags, object_root: false do

  attributes :id, :badge

  node :href do |tag|
    tag_url(tag) 
  end

  child :articles , object_root: false do
    attributes :title
    attributes :body
    attributes :id
  end

  node :linked do
  {
    tags: tags_url   
  }
  end

end