module ApplicationHelper
  def twitter_url(username: nil)
    "https://twitter.com/#{username.presence || 'subvisual'}"
  end
end
