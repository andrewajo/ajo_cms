module AjoCms
  class Page < ActiveRecord::Base
  	attr_accessible :name, :title, :layout, :section_id, :index_page, :position
  	has_many :posts
  	accepts_nested_attributes_for :posts
  	belongs_to :sections	
  	acts_as_list :scope => :section
  	default_scope order('position ASC')
  end

end
