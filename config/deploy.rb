set :repo_url, 'git@github-blog.subvisual.co:subvisual/blog.subvisual.co.git'
set :application, 'blog.subvisual.co'
set :stage, :production
set :branch, (ENV['DEPLOY_BRANCH'] || :master)
set :rails_env, :production

set :format, :pretty
set :log_level, :debug
set :pty, true

set :rvm_ruby_version, '2.2.2'

set :linked_files, %w{.env}
set :linked_dirs, %w{log public/system public/uploads}

set :bundle_without, %w(development test deploy).join(' ')
set :keep_releases, 3

set :foreman_export_path, '/home/deploy/.init'
set :foreman_options, {
  user: 'deploy',
  procfile: 'Procfile.production'
}

set :bower_bin, '/usr/bin/bower'

set :rollbar_token, ENV.fetch("ROLLBAR_ACCESS_TOKEN")
set :rollbar_env, Proc.new { fetch :stage }
set :rollbar_role, Proc.new { :app }

namespace :deploy do
  task :stop do
    begin
      invoke 'foreman:stop'
    rescue StandardError => e
      puts e.message
    end
  end

  desc 'Restart application'
  task :restart do
    invoke 'deploy:stop'
    invoke 'foreman:export'
    invoke 'foreman:start'
  end

  after :finishing, 'deploy:cleanup'
  after :finishing, 'deploy:restart'
end
