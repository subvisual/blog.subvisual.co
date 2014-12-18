class API::ApplicationController < ::ApplicationController
  skip_before_filter :verify_authenticity_token
  before_filter :restrict_access

  private

  def restrict_access
    return if Rails.env.test?

    authenticate_or_request_with_http_token do |token, _options|
      APIKey.exists?(access_token: token)
    end
  end
end
