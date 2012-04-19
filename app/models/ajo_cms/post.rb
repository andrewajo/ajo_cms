module AjoCms
  class Post < ActiveRecord::Base
  	belongs_to :pages
  	mount_uploader :image, ImageUploader
  end
end
