# encoding: utf-8

class ImageUploader < CarrierWave::Uploader::Base

  # Include RMagick or MiniMagick support:
  # include CarrierWave::RMagick
  include CarrierWave::MiniMagick

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
    process :resize_to_limit => [520, 520]
  end

  def crop
    if model.crop_x.present?
      @width = `identify -format "%wx%h" #{model.image.large.file.path}`.split(/x/)[0].to_i
      @height = `identify -format "%wx%h" #{model.image.large.file.path}`.split(/x/)[1].to_i
      @regularwidth = `identify -format "%wx%h" #{model.image.file.path}`.split(/x/)[0].to_i
      @regularheight = `identify -format "%wx%h" #{model.image.file.path}`.split(/x/)[1].to_i
      #resize_to_fit(@width, @height)
      Rails.logger.debug "Crop x: #{model.crop_x} Crop y: #{model.crop_y} Crop w: #{model.crop_w} Crop h: #{model.crop_h}"
      Rails.logger.debug "Width: #{@width}, Height: #{@height}, RegWidth: #{@regularwidth}, RegHeight: #{@regularheight}"
      manipulate! do |img|
        x = model.crop_x.to_i * @regularwidth / @width
        y = model.crop_y.to_i * @regularwidth / @height
        w = model.crop_w.to_i * @regularwidth / @width
        h = model.crop_h.to_i * @regularwidth / @height
        img.crop "#{w}x#{h}+#{x}+#{y}"
        img
      end
    end
  end

  version :slider do
    process :crop
    process :resize_to_fill => [940, 243]
  end
  version :thumb do
    process :resize_to_fit => [250, 250]
  end
  version :gallery do
    process :resize_to_fit => [350, 350]
  end

   #Add a white list of extensions which are allowed to be uploaded.
   #For images you might use something like this:
   #def extension_white_list
   #  %w(jpg jpeg gif png)
   #end
#
   #Override the filename of the uploaded files:
   #Avoid using model.id or version_name here, see uploader/store.rb for details.
   #def filename
   #  "something.jpg" if original_filename
   #end

end
