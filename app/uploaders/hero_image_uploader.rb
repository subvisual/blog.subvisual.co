# encoding: utf-8

class HeroImageUploader < CarrierWave::Uploader::Base
  include CarrierWave::RMagick

  version :thumb do
    process resize_to_fit: [0, 50]
  end

  def store_dir
    "blog/hero/#{model.id}"
  end

  def extension_white_list
    %w(jpg jpeg png)
  end
end
