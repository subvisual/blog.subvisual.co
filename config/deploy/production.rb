server '37.139.7.70', user: 'deploy', roles: %w{web app db}, primary: true
set :deploy_to, '/home/deploy/gb-blog'
