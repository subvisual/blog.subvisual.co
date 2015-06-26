if %w(production).include?(Rails.env)
  ActionMailer::Base.raise_delivery_errors = true
  ActionMailer::Base.delivery_method :smtp
  ActionMailer::Base.smtp_settings = {
    address:              ENV['MAILER_ADDRESS'],
    port:                 ENV['MAILER_PORT'],
    domain:               ENV['MAILER_DOMAIN'],
    user_name:            ENV['MAILER_USER_NAME'],
    password:             ENV['MAILER_PASSWORD'],
    authentication:       :plain,
    enable_starttls_auto: true
  }
end
