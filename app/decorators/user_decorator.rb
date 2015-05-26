class UserDecorator < Draper::Decorator
  delegate :first_name, :last_name, :bio, :has_twitter?, :twitter_handle, :twitter_handle?

  def full_name
    "#{first_name} #{last_name}".strip
  end

  def photo_url
    root = h.root_url.gsub(/^https?:/, '')
    "#{root}#{h.image_path(photo_name)}"
  end

  def twitter_url
    "https://twitter.com/#{twitter_handle}"
  end

  private

  def photo_name
    "authors/#{full_name.downcase.parameterize}.png"
  end
end
