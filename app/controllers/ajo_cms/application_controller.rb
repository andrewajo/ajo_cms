module AjoCms
  class ApplicationController < ActionController::Base
  	layout 'ajo_cms/admin'

  	@@company = Company.first
  end
end
