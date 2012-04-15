module AjoCms
  class PagesController < ApplicationController
  	def new
  		@section = Section.find(params[:section_id])
  		@pages = @section.pages.all
  		@page = Page.new
  	end
  end
end
