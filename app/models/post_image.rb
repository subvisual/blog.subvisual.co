require 'carrierwave/orm/activerecord'

class PostImage < ActiveRecord::Base
  belongs_to :post

  mount_uploader :image, PostImageUploader
end
