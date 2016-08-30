require "carrierwave/orm/activerecord"

class Hero < ActiveRecord::Base
  belongs_to :post

  mount_uploader :image, HeroImageUploader

  def image_url
    return unless image

    image.url
  end

  def remove_image=(val)
    image_will_change! if val
    super
  end
end
