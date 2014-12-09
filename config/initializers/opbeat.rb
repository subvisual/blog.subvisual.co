require 'opbeat'

if %w(production staging).include? Rails.env
  Opbeat.configure do |config|
    config.organization_id = ENV['OPBEAT_ORGANIZATION_ID']
    config.app_id = ENV['OPBEAT_APP_ID']
    config.secret_token = ENV['OPBEAT_SECRET_TOKEN']
  end
end
