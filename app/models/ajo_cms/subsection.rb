module AjoCms
  class Subsection < ActiveRecord::Base
    attr_accessible :page_id, :position, :layout
    has_many :posts, :dependent => :destroy

    def post_type(type)
		posts.where(:post_type => type)
    end
  end
end
