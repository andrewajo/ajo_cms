module AjoCms
  class SubsectionsController < ApplicationController
  	layout 'ajo_cms/admin'
  	def new
      @sections = Section.all
  		@section = Section.find(params[:section_id])
      @page = Page.find(params[:page_id])
      @subsection = Subsection.new
  	end
  	def create
  		@section = Section.find(params[:section_id])
  		@page = Page.find(params[:page_id])
  		@subsection = Subsection.new(params[:subsection])
  		if @subsection.save
  			redirect_to section_page_path(@section, @page), notice: 'Subsection created'
  		else
  			render 'new'
  		end
  	end
    def destroy
      @subsection = Subsection.find(params[:id])
      @subsection.destroy()

      redirect_to section_page_path(params[:section_id], params[:page_id])
    end
    def sort
      params[:page].each_with_index do |id, index|
        Page.update_all({position: index+1}, {id: id})
      end
      render nothing: true
    end
  end
end
