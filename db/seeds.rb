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

articles = Article.create([
  {
    title: "first article",
    author: "Karen",
    is_published: false,
    body: "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."
  },
  {
    title: "Second article",
    author: "Karen",
    is_published: true,
    body: "Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur?"
  },
  {
    title: "Third article",
    author: "Hamid",
    is_published: false,
    body: "But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness. No one rejects, dislikes, or avoids pleasure itself, because it is pleasure, but because those who do not know how to pursue pleasure rationally encounter consequences that are extremely painful. Nor again is there anyone who loves or pursues or desires to obtain pain"
  },
  {
    title: "Fourth article",
    author: "Hamid",
    is_published: true,
    body: "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."
  },
  {
    title: "Fifth article",
    author: "Me & I",
    is_published: true,
    body: "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."
  },
  {
    title: "Sixth article",
    author: "Hamid",
    is_published: true,
    body: "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."
  }
])

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
  }
]),

tags = Tag.create([
  {
    badge: "startup",
    articles: [articles[0], articles[1], articles[2], articles[3]]
  },
  {
    badge: "recruitment",
    articles: [articles[0], articles[1], articles[2], articles[4]]
  },
  {
    badge: "website",
    articles: [articles[0], articles[3], articles[5]]
  },
  {
    badge: "whops",
    articles: [articles[3], articles[4], articles[5]]
  }
])






