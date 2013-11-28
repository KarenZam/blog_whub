require 'faker'

Article.destroy_all
User.destroy_all
Tag.destroy_all
Registrant.destroy_all


registrants = Registrant.create([
  { email: "admin@admin.com" },
  { email: "chiara@farzam.com" },
  { email: "leo@farzam.com" },
  { email: "Cameron@farzam.com" },
  { email: "mila@farzam.com" }
])

users = User.create([
  {
    is_admin: true,
    email: "admin@admin.com",
    name: "the Administrator",
    password: "123",
    password_confirmation: "123"
  },
  {
    is_admin: false,
    email: "chiara@farzam.com",
    name: "Chiara",
    password: "123",
    password_confirmation: "123"
  },
  {
    is_admin: false,
    email: "leo@farzam.com",
    name: "Leo",
    password: "123",
    password_confirmation: "123"
  },
  {
    is_admin: false,
    email: "Cameron@farzam.com",
    name: "Cameron",
    password: "123",
    password_confirmation: "123"
  },
  {
    is_admin: false,
    email: "mila@farzam.com",
    name: "Mila",
    password: "123",
    password_confirmation: "123"
  }
])

articles = []
num = [2,3,4,5]

(1..30).to_a.each do
  articles << Article.create({
    title: Faker::Lorem.words(num.sample).join(" "),
    body: Faker::Lorem.paragraphs(num.sample).join("\n\n"),
    author: Faker::Name.name,
    is_published: (rand(55) % 2 == 0)
  })  
end

comments = Comment.create([
  {
    body: "This article is good.",
    article: articles[0],
    user: users[0]
  },
  {
    body: "This article is very good.",
    article: articles[0],
    user: users[1]
  },
  {
    body: "This article first is bad.",
    article: articles[0],
    user: users[2]
  },
  {
    body: "Article second comments.",
    article: articles[1],
    user: users[3]
  },
  {
    body: "Comments article second.",
    article: articles[1],
    user: users[4]
  },
  {
    body: "Article third.",
    article: articles[2],
    user: users[1]
  },
  {
    body: "user Cameron article third.",
    article: articles[2],
    user: users[3]
  },
  {
    body: "User Leo Article fourth.",
    article: articles[3],
    user: users[2]
  },
  {
    body: "User Admin Article fourth.",
    article: articles[3],
    user: users[0]
  },
  {
    body: "What a comment",
    article: articles[4],
    user: users[2]
  },
  {
    body: "User Admin Sxth fourth.",
    article: articles[5],
    user: users[0]
  },
  {
    body: "User Admin Sxth fourth.",
    article: articles[6],
    user: users[0]
  },
  {
    body: "User Admin Sxth fourth.",
    article: articles[7],
    user: users[0]
  },
  {
    body: "User Admin Sxth fourth.",
    article: articles[8],
    user: users[0]
  },
  {
    body: "User Admin Sxth fourth.",
    article: articles[9],
    user: users[0]
  },
  {
    body: "User Admin Sxth fourth.",
    article: articles[10],
    user: users[0]
  },
  {
    body: "User Admin Sxth fourth.",
    article: articles[11],
    user: users[1]
  }
])

tags = Tag.create([
  {
    badge: "startup",
    articles: [articles[0], articles[1], articles[2], articles[3], articles[9], articles[10]]
  },
  {
    badge: "recruitment",
    articles: [articles[0], articles[1], articles[2], articles[4]]
  },
  {
    badge: "website",
    articles: [articles[0], articles[3], articles[5], articles[6], articles[8], articles[7]]
  },
  {
    badge: "whops",
    articles: [articles[3], articles[4], articles[5], articles[11], articles[12]]
  }
])






