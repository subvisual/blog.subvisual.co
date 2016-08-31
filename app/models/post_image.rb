require "carrierwave/orm/activerecord"

class PostImage < ActiveRecord::Base
  mount_uploader :image, PostImageUploader

  version :retina do
    process resize_to_limit: [600 * 2, nil]
  end
  version :regular do
    process resize_to_limit: [600, nil]
  end
  process optimize: [quality: 80]

  def image_url
    return unless image

    image.url
  end

  def remove_image=(val)
    image_will_change! if val
    super
  end
end
