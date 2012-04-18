module AjoCms
  class ViewsController < ApplicationController
  	layout 'ajo_cms/public'

  	def index
  		@company = Company.first
      @sections = Section.order('position')
  		@section = Section.first
  		@page = @section.pages.first
  		@site_layout = Company.first.layout.nil? ? 'default' : Company.first.layout
      @page_layout = @page.layout.nil? ? 'default' : @page.layout
  	end

  	def section
  		@company = Company.first
      @sections = Section.order('position')
  		@section = Section.where(:name => params[:section_name]).first
      @page = @section.pages.first
      @site_layout = Company.first.layout.nil? ? 'default' : Company.first.layout
      @page_layout = @page.layout.nil? ? 'default' : @page.layout
      if params[:page_name]
        @section.pages.where(:name => params[:page_name])
      else
    		@page = @section.pages.first
      end
  		@layout = 'default'
  	end
  end
end
