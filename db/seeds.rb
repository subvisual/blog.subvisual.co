users = [
  { first_name: 'Roberto', last_name: 'Machado', email: 'roberto@groupbuddies.com', twitter_handle: 'rmdgb' },
  { first_name: 'Miguel',  last_name: 'Palhas',  email: 'mpalhas@groupbuddies.com',    twitter_handle: 'naps62' },
  { first_name: 'Luis',    last_name: 'Zamith',  email: 'zamith@groupbuddies.com',     twitter_handle: 'zamith' },
  { first_name: 'João',    last_name: 'Ferreira', email: 'joao@groupbuddies.com',      twitter_handle: 'jferreiradzn' },
  { first_name: 'Ronaldo', last_name: 'Sousa',    email: 'ronaldo@groupbuddies.com',   twitter_handle: 'ronaldofsousa' },
  { first_name: 'Gabriel', last_name: 'Poça',     email: 'gabriel@groupbuddies.com',   twitter_handle: 'gabrielgpoca' },
  { first_name: 'Bruno',   last_name: 'Azevedo',  email: 'bruno@groupbuddies.com' }
]

users.each do |user_data|
  User.where(user_data).first_or_initialize.tap do |user|
    user.password = user.email.split('@').first
    user.bio = 'Nothing to say yet...'
    user.save!
  end
end
