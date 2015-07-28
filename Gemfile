source 'https://rubygems.org'

gem 'rails', '~> 4.2.1'

gem 'acts-as-taggable-on'
gem 'analytics-ruby', require: 'segment/analytics'
gem 'appsignal', github: 'groupbuddies/appsignal', branch: 'server-notify'
gem 'autoprefixer-rails'
gem 'bower'
gem 'cancan'
gem 'carrierwave'
gem 'coffee-rails', '~> 4.0.0'
gem 'clearance', '1.10.1'
gem 'dotenv-rails'
gem 'draper', '~> 1.3'
gem 'elasticsearch-model'
gem 'elasticsearch-rails'
gem 'headquarters'
gem 'jquery-rails'
gem 'jquery-ui-rails'
gem 'jquery-turbolinks'
gem 'omniauth'
gem 'omniauth-headquarters'
gem 'pg'
gem 'puma'
gem 'redcarpet', require: false
gem 'rouge', require: false
gem 'rmagick'
gem 'sass-rails', '~> 5.0.0'
gem 'sass', '~> 3.4.0'
gem 'slim-rails'
gem 'simple-random'
gem 'sprockets'
gem 'sprockets-es6', require: 'sprockets/es6'
gem 'truncate_html'
gem 'uglifier', '>= 1.0.3'

group :production do
  gem 'newrelic_rpm'
  gem 'skylight'
end

group :development do
  gem 'better_errors'
  gem 'binding_of_caller'
  gem 'meta_request'
  gem 'quiet_assets'
  gem 'rack-mini-profiler'
end

group :test do
  gem 'codeclimate-test-reporter', require: false
  gem 'database_cleaner', '1.0.1', require: false
  gem 'elasticsearch-extensions'
  gem 'factory_girl_rails', '~> 4.0', require: false
  gem 'fakefs', require: 'fakefs/safe'
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
  gem 'scss_lint', require: false
end

group :production do
  gem 'foreman'
end

group :deploy do
  gem 'capistrano', '~> 3.2.1'
  gem 'capistrano-rvm'
  gem 'capistrano-rails'
  gem 'capistrano-bundler'
  gem 'capistrano-bower', github: 'groupbuddies/capistrano-bower'
  gem 'capistrano-foreman', github: 'groupbuddies/capistrano-foreman', branch: :master
end
