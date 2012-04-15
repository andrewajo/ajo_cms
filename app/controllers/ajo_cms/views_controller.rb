module AjoCms
  class ViewsController < ApplicationController
  	layout 'ajo_cms/public'

  	def index
  		@company = Company.first
  		@section = Section.first
  		@page = @section.pages.first
  		@layout = Company.first.layout.nil? ? 'default' : Company.first.layout
  	end

  	def section
  		@company = Company.first
  		@section = Section.where(:name => params[:section_name]).first
      if params[:page_name]
        @section.pages.where(:name => params[:page_name])
      else
    		@page = @section.pages.first
      end
  		@layout = 'default'
  	end
  end
end
