# TODO setup vagrant here
# server 'localhost', user: 'deploy', roles: %w{web app db}, primary: true
set :ssh_options, { port: 2222, forward_agent: true }
set :deploy_to, '/home/deploy/gb-blog'
