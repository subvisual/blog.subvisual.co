source 'https://rubygems.org'

gem 'rails', '~> 4.0.2'

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
gem 'puma'
gem 'pygmentize', require: false
gem 'redcarpet', require: false
gem 'rmagick'
gem 'sass-rails', '~> 4.0.0'
gem 'slim-rails'
gem 'uglifier', '>= 1.0.3'
gem 'susy'
gem 'newrelic_rpm'

group :development do
  gem 'better_errors'
  gem 'binding_of_caller'
  gem 'meta_request'
  gem 'pry-rails'
  gem 'quiet_assets'
end

group :test do
  gem 'database_cleaner', '<= 1.1.0', require: false
  gem 'factory_girl_rails', '~> 4.0', require: false
  gem 'faker', require: false
  gem 'simplecov', require: false
  gem 'rspec-html-matchers', require: false
  gem 'rubocop', require: false
  gem 'pippi'
end

group :development, :test do
  gem 'rspec-rails', '~> 2.0'
  gem 'jasmine-rails'
  gem 'jasmine-jquery-rails'
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
