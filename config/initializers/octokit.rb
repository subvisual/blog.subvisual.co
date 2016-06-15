if Rails.env.production?
  Octokit.configure do |config|
    config.login = ENV.fetch('GH_USERNAME')
    config.password = ENV.fetch('GH_PASSWORD')
  end
end
