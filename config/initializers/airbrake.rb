if Rails.env.production?
  Airbrake.configure do |config|
    config.api_key = ENV['AIRBRAKE_API_KEY']
    config.host    = 'log.groupbuddies.com'
    config.port    = 443
    config.secure  = (config.port == 443)

    config.user_attributes = %i(id email)
  end
end
