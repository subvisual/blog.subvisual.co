require 'carrierwave/orm/activerecord'

class PostImage < ActiveRecord::Base
  mount_uploader :image, PostImageUploader
end
