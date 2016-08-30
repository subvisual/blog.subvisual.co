CarrierWave.configure do |config|
  if Rails.env.production?
    config.storage = :fog

    config.fog_credentials = {
      provider: "AWS",
      aws_access_key_id: ENV.fetch("AWS_KEY"),
      aws_secret_access_key: ENV.fetch("AWS_SECRET"),
      region: "eu-west-1",
    }
    config.fog_directory = ENV.fetch("AWS_BUCKET")
    config.fog_attributes = { "Cache-Control" => "max-age=#{365.day.to_i}" }
  else
    config.storage = :file
    config.enable_processing = !Rails.env.test?
  end
end
