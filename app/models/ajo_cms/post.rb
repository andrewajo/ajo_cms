module AjoCms
  class Post < ActiveRecord::Base
  	attr_accessible :title, :content, :post_type, :page_id, :image, :file, :date

  	default_scope order('position ASC')

  	belongs_to :pages
  	mount_uploader :image, ImageUploader
  	mount_uploader :file, FileUploader
	  def next
	  	self.class.find(:first, :conditions => ["id > ? And page_id = ?", self.id, self.page_id])
	  end

	  def last
	  	self.class.find(:first, :conditions => ["id < ? And page_id = ?", self.id, self.page_id])
	  end
  end
end
