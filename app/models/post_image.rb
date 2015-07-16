require 'carrierwave/orm/activerecord'

class PostImage < ActiveRecord::Base
  include CarrierWave::Backgrounder::Delay

  belongs_to :post

  mount_uploader :image, PostImageUploader
  # process_in_background :image

  def remove_image=(val)
    image_will_change! if val
    super
  end
end
