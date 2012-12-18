module AjoCms
  class Subsection < ActiveRecord::Base
    attr_accessible :page_id, :position, :layout
    has_many :posts, :dependent => :destroy
    belongs_to :pages
    acts_as_list :scope => :page
  	default_scope order('position ASC')
  	
    def post_type(type)
		posts.where(:post_type => type)
    end
  end
end
