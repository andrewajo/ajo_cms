module AjoCms
  class Section < ActiveRecord::Base
  	has_many :pages, :dependent => :destroy
  	accepts_nested_attributes_for :pages
  	before_save :create_index
  	acts_as_list

  	def create_index
  		self.pages.build(:name => 'Section Page')
  		true
  	end
  end
end