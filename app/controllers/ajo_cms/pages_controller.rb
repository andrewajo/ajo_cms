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

    def create
      @page = Page.new(params[:page])
      if @page.save
        redirect_to section_path(params[:section_id]), notice: "Page added!"
      else
        render :action => "new"
      end
    end

  end
end
