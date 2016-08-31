# encoding: utf-8

class PostImageUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick
  include CarrierWave::ImageOptimizer

  def filename
    "image.#{model.image.file.extension}" if original_filename
  end

  version :retina do
    process resize_to_limit: [600 * 2, nil]
  end
  version :regular do
    process resize_to_limit: [600, nil]
  end
  process optimize: [quality: 80]

  def store_dir
    "blog/#{model.class.to_s.underscore}/#{model.id}"
  end

  def extension_white_list
    %w(jpg jpeg gif png)
  end
end
