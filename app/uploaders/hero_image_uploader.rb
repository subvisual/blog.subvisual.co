# encoding: utf-8

class HeroImageUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick
  include CarrierWave::ImageOptimizer

  def filename
    "original.#{model.image.file.extension}" if original_filename
  end

  version :retina do
    process resize_to_limit: [1920 * 2, nil]
    process convert: "jpg"
    process :convert_to_progressive
    def full_filename(_file = model.logo.file)
      "image@2x.jpg"
    end
  end
  version :regular do
    process resize_to_limit: [1920, nil]
    process convert: "jpg"
    process :convert_to_progressive
    def full_filename(_file = model.logo.file)
      "image.jpg"
    end
  end
  process optimize: [quality: 80, level: 3]

  def store_dir
    "blog/hero/#{model.id}"
  end

  def extension_white_list
    %w(jpg jpeg png)
  end

  private

  def convert_to_progressive
    manipulate! do |img|
      return img unless img.mime_type =~ %r{image/jpeg}

      img.strip
      img.combine_options do |c|
        c.quality "80"
        c.depth "8"
        c.interlace "plane"
      end
      img
    end
  end
end
