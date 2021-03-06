users = [
  { first_name: "Roberto", last_name: "Machado", email: "roberto@subvisual.co", twitter_handle: "rmdgb" },
  { first_name: "Miguel",  last_name: "Palhas",  email: "miguel@subvisual.co",    twitter_handle: "naps62" },
  { first_name: "Luis",    last_name: "Zamith",  email: "zamith@subvisual.co",     twitter_handle: "zamith" },
  { first_name: "João",    last_name: "Ferreira", email: "joao@subvisual.co",      twitter_handle: "jferreiradzn" },
  { first_name: "Ronaldo", last_name: "Sousa",    email: "ronaldo@subvisual.co",   twitter_handle: "ronaldofsousa" },
  { first_name: "Gabriel", last_name: "Poça",     email: "gabriel@subvisual.co",   twitter_handle: "gabrielgpoca" },
  { first_name: "Bruno",   last_name: "Azevedo",  email: "bruno@subvisual.co" }
]

users.each do |user_data|
  User.where(user_data).first_or_initialize.tap do |user|
    user.password = user.email.split("@").first
    user.bio = "Nothing to say yet..."
    user.save!
  end
end
