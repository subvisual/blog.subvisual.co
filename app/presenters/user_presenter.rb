class UserPresenter < RailsPresenter::Base

  def self.model_name
    User.model_name
  end

  def photo
    h.image_tag "authors/#{first_name.downcase}.png"
  end

  def twitter_url
    "https://twitter.com/#{twitter_handle}"
  end

end
