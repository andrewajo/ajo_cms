module AjoCms
  class SectionsController < ApplicationController
    layout 'ajo_cms/admin'
  	def index
  		@sections = Section.order(:position)
  	end

  	def new
  		@sections = Section.all
  		@section = Section.new
  	end

  	def show
      @sections = Section.all
  		@section = Section.find(params[:id])
  		@pages = @section.pages.all
  	end

  	def edit
  		@sections = Section.all
  		@section = Section.find(params[:id])
  	end

  	def create
  		@section = Section.new(params[:section])

  		if @section.save
  			redirect_to sections_path, notice: "Section created!"
  		else
  			render :action => "new"
  		end
  	end

    def sort
      params[:section].each_with_index do |id, index|
        Section.update_all({position: index+1}, {id: id})
      end
      render nothing: true
    end

  	def update
  		@section = Section.find(params[:id])
  		if @section.update_attributes(params[:section])
  			redirect_to sections_path, notice: "Section updated!"
  		else
  			render :action => "edit"
  		end
  	end

  	def destroy
  		@section = Section.find(params[:id])
  		@section.destroy

  		redirect_to sections_path, notice: "Section deleted!"
  	end
  end
end
