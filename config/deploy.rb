require "bundler/capistrano"
require 'puma/capistrano'

set :application, "gb-blog"
set :repository,  "git@github.com:groupbuddies/gb-blog.git"

set :scm, :git
set :ssh_options, { :forward_agent => true, :port => 22 }
set :branch, "master"
set :deploy_via, :remote_cache
set :keep_releases, 3

server = "37.139.7.70"

role :web, server
role :app, server
role :db,  server, :primary => true # This is where Rails migrations will run

set :user, "deploy"

set :deploy_to, "/home/#{user}/#{application}"
set :use_sudo, false

default_run_options[:shell] = '/bin/bash --login'
default_environment["RAILS_ENV"] = 'production'

before "deploy", "deploy:setup"
after "deploy:update_code", "deploy:migrate"
# after "deploy:update", "unicorn:restart"
after "deploy:update", "deploy:cleanup"
after "deploy:finalize_update","deploy:config_symlink"

before "deploy", "puma:stop"
after "deploy", "puma:start"

namespace :deploy do
  task :config_symlink do
    run "ln -nfs #{shared_path}/database.yml #{release_path}/config/database.yml"
    run "ln -nfs #{shared_path}/accounts.yml #{release_path}/config/accounts.yml"
  end
end

desc "tail production log files"
task :tail, :roles => :app do
  trap("INT") { puts 'Interupted'; exit 0; }
  run "tail -f #{shared_path}/log/production.log" do |channel, stream, data|
    puts  # for an extra line break before the host name
    puts "#{channel[:host]}: #{data}"
    break if stream == :err
  end
end
