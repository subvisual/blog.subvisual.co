require 'carrierwave/orm/activerecord'

class PostImage < ActiveRecord::Base
  belongs_to :post

  mount_uploader :image, PostImageUploader

  def remove_image=(val)
    image_will_change! if val
    super
  end
end
