if Rails.env.production?
  Airbrake.configure do |config|
    config.api_key = ENV['AIRBRAKE_API_KEY']
    config.host = 'log.subvisual.co'
    config.port = 443
    config.secure = (config.port == 443)
  end
end
