module AjoCms
  class ViewsController < ApplicationController
    skip_before_filter :authenticate
    before_filter :set_defaults
  	layout 'ajo_cms/public'
    
    def set_defaults
      @site_layout = Company.first.layout.nil? ? 'default' : Company.first.layout
      @company = Company.first
      @sections = Section.order('position')
    end
    
  	def index
  		@section = Section.first
  		@page = @section.pages.first
      @subsections = @page.subsections
  	end

  	def section
  		@section = Section.where(:name => params[:section_name]).first
      if params[:page_name]
        @page = @section.pages.where(:name => params[:page_name]).first
      else
        @page = @section.pages.first
      end
      @subsections = @page.subsections
  	end

    def post
      @section = Section.where(:name => params[:section_name]).first
      @page = params[:page_name].nil? ? @section.pages.first : @section.pages.where(:name => params[:page_name]).first
      @subsections = @page.subsections
      @post = Post.find(params[:post_id])
    end
  end
end
