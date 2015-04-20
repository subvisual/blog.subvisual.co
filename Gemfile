source 'https://rubygems.org'

gem 'rails', '~> 4.1.0'

gem 'appsignal', github: 'groupbuddies/appsignal', branch: 'server-notify'
gem 'autoprefixer-rails'
gem 'cancan'
gem 'carrierwave'
gem 'coffee-rails', '~> 4.0.0'
gem 'compass-rails', '~> 1.1.3'
gem 'clearance', '1.0.0.rc7'
gem 'draper', '~> 1.3'
gem 'jquery-rails'
gem 'jquery-ui-rails'
gem 'jquery-turbolinks'
gem 'pg'
gem 'piet'
gem 'piet-binary'
gem 'puma'
gem 'pygmentize', require: false
gem 'redcarpet', require: false
gem 'rmagick'
gem 'sass-rails', '~> 4.0.0'
gem 'slim-rails'
gem 'uglifier', '>= 1.0.3'
gem 'susy'

group :production do
  gem 'newrelic_rpm'
end

group :development do
  gem 'better_errors'
  gem 'binding_of_caller'
  gem 'meta_request'
  gem 'quiet_assets'
end

group :test do
  gem 'database_cleaner', '1.0.1', require: false
  gem 'factory_girl_rails', '~> 4.0', require: false
  gem 'faker', require: false
  gem 'simplecov', require: false
  gem 'rspec-html-matchers', require: false
  gem 'rubocop', require: false
  gem 'pippi'
end

group :development, :test do
  gem 'jasmine-jquery-rails'
  gem 'jasmine-rails'
  gem 'pry-rails'
  gem 'rspec-rails'
end

group :production do
  gem 'dotenv-rails'
  gem 'foreman'
end

group :deploy do
  gem 'capistrano', '~> 3.2.1'
  gem 'capistrano-rvm'
  gem 'capistrano-rails'
  gem 'capistrano-bundler'
  gem 'capistrano-foreman', github: 'groupbuddies/capistrano-foreman', branch: :master
end
