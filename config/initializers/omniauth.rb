Rails.application.config.middleware.use OmniAuth::Builder do
  provider :headquarters, ENV['HQ_APP_ID'], ENV['HQ_APP_SECRET'], request_path: '/blog/auth/headquarters', callback_path: '/blog/auth/headquarters/callback'
end
