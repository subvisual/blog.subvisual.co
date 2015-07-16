require 'sidekiq/web'

Sidekiq.configure_server do |config|
  config.redis = { url: ENV['REDIS_URL'] }
end

if Rails.env.production? || Rails.env.staging?
  Sidekiq::Web.use Rack::Auth::Basic do |username, password|
    username == ENV['SIDEKIQ_USERNAME'] && password == ENV['SIDEKIQ_PASSWORD']
  end
end

if Rails.env.test?
  require 'sidekiq/testing'
  Sidekiq::Testing.inline!
end
