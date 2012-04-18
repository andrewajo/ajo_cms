module AjoCms
  class Section < ActiveRecord::Base
  	has_many :pages, :dependent => :destroy
  	accepts_nested_attributes_for :pages
  	before_save :create_index
  	acts_as_list

  	def create_index
  		self.pages.build(:index_page => true, :name => 'index')
  		true
  	end
  end
end