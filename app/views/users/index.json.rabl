object false

child @users, object_root: false do

  attributes :id, :name, :email, :is_admin

  node :href do |user|
    user_url(user)
  end

  node :linked do
  {
    users: users_url,
    articles: articles_url
  }
  end

  node :links do |user|
    user_articles_url(user)
  end

end

