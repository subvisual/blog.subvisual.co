class UserDecorator < Draper::Decorator
  delegate :first_name, :last_name, :email, :bio, :has_twitter?, :twitter_handle, :name

  def photo_url(suffix = "")
    h.image_url(photo_name(suffix))
  end

  def twitter_url
    "https://twitter.com/#{twitter_handle}"
  end

  private

  def photo_name(suffix = "")
    "authors/#{name.downcase.parameterize}#{suffix}.png"
  end
end
