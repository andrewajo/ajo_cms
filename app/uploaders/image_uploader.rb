# encoding: utf-8

class ImageUploader < CarrierWave::Uploader::Base

  # Include RMagick or MiniMagick support:
  include CarrierWave::RMagick
  # include CarrierWave::MiniMagick

  # Choose what kind of storage to use for this uploader:
  #storage :file
  storage :fog

  # Override the directory where uploaded files will be stored.
  # This is a sensible default for uploaders that are meant to be mounted:
  def cache_dir
    "#{Rails.root}/tmp/uploads"
  end

  # Provide a default URL as a default if there hasn't been a file uploaded:
  # def default_url
  #   "/images/fallback/" + [version_name, "default.png"].compact.join('_')
  # end

  # Process files as they are uploaded:
  # process :scale => [200, 300]
  #
  # def scale(width, height)
  #   # do something
  # end

  # Create different versions of your uploaded files:
  version :large do
    process :resize_to_limit => [529, 529]
  end

  def crop
    if model.crop_x.present?
      #resize_to_fit(1080, 1080)
      @width = `identify -format "%wx%h" #{model.image.file.path}`.split(/x/)[0].to_i
      @height = `identify -format "%wx%h" #{model.image.file.path}`.split(/x/)[1].to_i
      Rails.logger.debug "#{@width}, #{@height}"
      manipulate! do |img|
        x = model.crop_x.to_i * 940 / @width
        y = model.crop_y.to_i * 247 / @height
        w = model.crop_w.to_i * 940/ @width
        h = model.crop_h.to_i * 247 / @height
        img.crop!(x, y, w, h)
      end
    end
  end

  version :slider do
    process :crop
    process :resize_to_fill => [940, 247]
  end
  version :thumb do
    process :resize_to_fit => [250, 250]
  end
  version :gallery do
    process :resize_to_fit => [350, 350]
  end

  # Add a white list of extensions which are allowed to be uploaded.
  # For images you might use something like this:
  # def extension_white_list
  #   %w(jpg jpeg gif png)
  # end

  # Override the filename of the uploaded files:
  # Avoid using model.id or version_name here, see uploader/store.rb for details.
  # def filename
  #   "something.jpg" if original_filename
  # end

end
