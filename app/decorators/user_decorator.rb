class UserDecorator < Draper::Decorator
  delegate :first_name, :last_name, :bio, :has_twitter?, :twitter_handle, :twitter_handle?

  def full_name
    "#{first_name} #{last_name}".strip
  end

  def photo_url
    h.image_url(photo_name)
  end

  def twitter_url
    "https://twitter.com/#{twitter_handle}"
  end

  private

  def photo_name
    "authors/#{full_name.downcase.parameterize}.png"
  end
end
