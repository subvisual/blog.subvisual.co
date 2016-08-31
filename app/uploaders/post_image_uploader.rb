# encoding: utf-8

class PostImageUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick
  include CarrierWave::ImageOptimizer

  def filename
    "original.#{model.image.file.extension}" if original_filename
  end

  version :retina do
    process resize_to_limit: [600 * 2, nil]
    def full_filename(file = model.logo.file)
      "image@2x#{File.extname(file)}"
    end
  end
  version :regular do
    process resize_to_limit: [600, nil]
    def full_filename(file = model.logo.file)
      "image#{File.extname(file)}"
    end
  end
  process optimize: [quality: 80, level: 3]

  def store_dir
    "blog/#{model.class.to_s.underscore}/#{model.id}"
  end

  def extension_white_list
    %w(jpg jpeg gif png)
  end
end
