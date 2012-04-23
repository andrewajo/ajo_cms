module AjoCms
  class Post < ActiveRecord::Base
  	attr_accessible :title, :content, :post_type, :page_id, :image, :date

  	belongs_to :pages
  	mount_uploader :image, ImageUploader
	  def next
	  	self.class.find(:first, :conditions => ["id > ? And page_id = ?", self.id, self.page_id])
	  end

	  def last
	  	self.class.find(:first, :conditions => ["id < ? And page_id = ?", self.id, self.page_id])
	  end
  end
end
