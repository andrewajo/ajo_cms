module AjoCms
  class Section < ActiveRecord::Base
    attr_accessible :name, :title, :position

  	has_many :pages, :dependent => :destroy
  	accepts_nested_attributes_for :pages
  	before_create :create_index
    default_scope order('position ASC')
  	acts_as_list

  	def create_index
  		self.pages.build(:name => 'Section Page')
  		true
  	end
  end
end