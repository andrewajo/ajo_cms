module AjoCms
  class Post < ActiveRecord::Base
  	attr_accessible :title, :content, :post_type, :page_id, :image

  	belongs_to :pages
  	mount_uploader :image, ImageUploader
  end
end
