module AjoCms
  class Page < ActiveRecord::Base
  	attr_accessible :name
  	has_many :posts
  	accepts_nested_attributes_for :posts
  	belongs_to :sections	
  	acts_as_list
  end

end
