users = [
  { first_name: "Roberto", last_name: "Machado", email: "rmdmachado@groupbuddies.com"},
  { first_name: "Miguel",  last_name: "Palhas",  email: "mpalhas@groupbuddies.com"}
]

users.each do |user_data|
  User.where(user_data).first_or_initialize.tap do |user|
    user.password = user.email.split("@").first
    user.save!
  end
end

categories = [
  { name: "Development" },
  { name: "Design" },
  { name: "Business" },
  { name: "Sys Admin" },
  { name: "Miscellanea" }
]

categories.each do |category_data|
  Category.where(category_data).first_or_create!
end

posts = [
  { author_id: 1, title: "OMG a post",                body: "This isn't really a good post", category_id: 1 },
  { author_id: 2, title: "And another, better, post", body: "Now this i like!",              category_id: 2, published_at: Time.now }
]

posts.each do |post_data|
  Post.where(post_data).first_or_create!
end
