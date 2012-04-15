module AjoCms
  class Page < ActiveRecord::Base
  	belongs_to :sections
  end
end
