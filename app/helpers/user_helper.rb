module UserHelper
  def user_photo_path(user, suffix = '')
    image_path("authors/#{user.name.downcase.parameterize}#{suffix}.png")
  end
end
