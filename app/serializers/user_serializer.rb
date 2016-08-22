class UserSerializer < ActiveModel::Serializer
  attributes :id, :email, :first_name, :last_name,
    :twitter_handle, :photo_url

  def photo_url
    ActionController::Base.helpers.image_url(photo_name)
  end

  private

  def photo_name
    "authors/#{object.name.downcase.parameterize}_50.png"
  end
end
