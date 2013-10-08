source 'https://rubygems.org'

gem 'rails', '~> 4.0.0'

gem 'coffee-rails', '~> 4.0.0'
gem 'compass-rails', '~> 2.0.alpha.0'
gem 'clearance', '1.0.0.rc7'
gem 'capistrano'
gem 'jquery-rails'
gem 'jquery-ui-rails'
gem 'jquery-turbolinks'
gem 'puma'
gem 'rails_presenter', github: 'dfmonaco/rails_presenter'#, ref: '43159592a86e12a99da2682a77b7341fe5e04eb0'
gem 'sass-rails', '~> 4.0.0'
gem 'slim-rails'
gem 'sqlite3'
gem 'turbolinks'
gem 'uglifier', '>= 1.0.3'
gem 'zurb-foundation', '~> 4.0.0'

group :development do
  gem 'better_errors'
  gem 'binding_of_caller'
  gem 'guard'
  gem 'guard-rspec'
  gem 'meta_request'
  gem 'pry-rails'
end

group :test do
  gem 'database_cleaner', '<= 1.1.0', require: false
  gem 'factory_girl_rails', '~> 4.0', require: false
  gem 'faker', require: false
  gem 'simplecov', require: false
end

group :development, :test do
  gem 'rspec-rails', '~> 2.0'
  gem 'jasmine-rails'
  gem 'jasmine-jquery-rails'
end

group :production do
  gem 'pg'
end
