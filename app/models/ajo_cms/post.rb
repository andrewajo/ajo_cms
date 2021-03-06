module AjoCms
  class Post < ActiveRecord::Base
  	attr_accessible :title, :content, :post_type, :subsection_id, :image, :file, :date, :crop_x, :crop_y, :crop_w, :crop_h

  	default_scope order('position ASC')

  	belongs_to :subsection
  	mount_uploader :image, ImageUploader
  	mount_uploader :file, FileUploader
    attr_accessor :crop_x, :crop_y, :crop_w, :crop_h
    after_update :crop_image


    def crop_image
      image.recreate_versions! if crop_x.present?
    end

	  def next
	  	self.class.find(:first, :conditions => ["id > ? And subsection_id = ?", self.id, self.subsection_id])
	  end

	  def last
	  	self.class.find(:first, :conditions => ["id < ? And subsection_id = ?", self.id, self.subsection_id])
	  end
  end
end
