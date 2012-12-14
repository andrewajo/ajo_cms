module AjoCms
  class Page < ActiveRecord::Base
  	attr_accessible :name, :title, :layout, :section_id, :index_page, :position
  	has_many :subsections, :dependent => :destroy
  	accepts_nested_attributes_for :subsections
  	belongs_to :sections	
  	acts_as_list :scope => :section
  	default_scope order('position ASC')
  end

end
