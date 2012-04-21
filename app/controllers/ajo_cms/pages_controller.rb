module AjoCms
  class PagesController < ApplicationController
  	layout 'ajo_cms/admin'
  	def new
  		@section = Section.find(params[:section_id])
  		@pages = @section.pages.all
  		@page = Page.new
  	end

    def show
      @section = Section.find(params[:section_id])
      @page = Page.find(params[:id])
      @posts = @page.posts.all
      @sliders = @page.posts.where(:post_type => 'slider')
      @headlines = @page.posts.where(:post_type => 'headline')
      @images = @page.posts.where(:post_type => 'gallery')
    end

  	def edit
  		@section = Section.find(params[:section_id])
  		@pages = @section.pages.all
  		@page = Page.find(params[:id])
      @sliders = @page.posts.where(:post_type => 'slider')
  	end

    def update
      @section = Section.find(params[:section_id])
      @pages = @section.pages.all
      @page = Page.find(params[:id])

      if @page.update_attributes(params[:page])
        redirect_to section_path(@section), notice: "Page updated!"
      else
        render :action => :edit
      end
    end


    def create
      @page = Page.new(params[:page])
      if @page.save
        redirect_to section_path(params[:section_id]), notice: "Page added!"
      else
        render :action => "new"
      end
    end

    def destroy
      @page = Page.find(params[:id])

      @page.destroy

      redirect_to section_path(params[:section_id]), notice: "Page successfully deleted!"
    end
  end
end
