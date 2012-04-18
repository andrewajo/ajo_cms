module AjoCms
  class PagesController < ApplicationController
  	layout 'ajo_cms/admin'
  	def new
  		@section = Section.find(params[:section_id])
  		@pages = @section.pages.all
  		@page = Page.new
  	end

  	def edit
  		@section = Section.find(params[:section_id])
  		@pages = @section.pages.all
  		@page = Page.find(params[:id])
  	end
  end
end
