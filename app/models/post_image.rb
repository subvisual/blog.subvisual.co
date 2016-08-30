require "carrierwave/orm/activerecord"

class PostImage < ActiveRecord::Base
  mount_uploader :image, PostImageUploader

  def image_url
    return unless image

    image.url
  end

  def remove_image=(val)
    image_will_change! if val
    super
  end
end
