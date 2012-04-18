module AjoCms
  class Page < ActiveRecord::Base
  	belongs_to :sections
  	acts_as_list
  end
end
