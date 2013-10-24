set :application, 'gb-blog'
set :repo_url, 'git@github.com:groupbuddies/gb-blog.git'

set :scm, :git
set :ssh_options, { forward_agent: true, port: 22 }
set :keep_releases, 3

server '37.139.7.70', user: 'deploy', roles: %w{db web app}

# set :format, :pretty
# set :log_level, :info
# set :pty, true

set :linked_files, %w{config/database.yml}

namespace :deploy do

  desc 'Restart application'
  task :restart do
    on roles(:app), in: :sequence, wait: 5 do
      # Your restart mechanism here, for example:
      # execute :touch, release_path.join('tmp/restart.txt')
    end
  end

  after :restart, :clear_cache do
    on roles(:web), in: :groups, limit: 3, wait: 10 do
      # Here we can do anything such as:
      # within release_path do
      #   execute :rake, 'cache:clear'
      # end
    end
  end

  after :finishing, 'deploy:cleanup'
  after :finishing, 'puma:restart'

end
