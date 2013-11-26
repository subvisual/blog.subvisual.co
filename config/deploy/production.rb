server '37.139.7.70', user: 'deploy', roles: %w{db web app}

set :stage, :production
set :rails_env, 'production'
set :branch, 'master'
set :deploy_to, '/home/deploy/gb-blog'
