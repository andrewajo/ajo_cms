module AjoCms
  class ViewsController < ApplicationController
    skip_before_filter :authenticate
  	layout 'ajo_cms/public'

  	def index
  		@company = Company.first
      @sections = Section.order('position')
  		@section = Section.first
  		@page = @section.pages.first
      @posts = @page.posts.all
      @sliders = @page.posts.where(:post_type => 'slider')
      @images = @page.posts.where(:post_type => 'gallery')
      @headlines = @page.posts.where(:post_type => 'headline')
      @files = @page.posts.where(:post_type => 'attachment')
      @blogs = @page.posts.where(:post_type => 'blog')
  		@site_layout = Company.first.layout.nil? ? 'default' : Company.first.layout
      @page_layout = @page.layout.nil? ? 'default' : @page.layout
  	end

  	def section
  		@company = Company.first
      @sections = Section.order('position')
  		@section = Section.where(:name => params[:section_name]).first
      @page = params[:page_name].nil? ? @section.pages.first : @section.pages.where(:name => params[:page_name].strip).first
      @posts = @page.posts
      @sliders = @page.posts.where(:post_type => 'slider')
      @images = @page.posts.where(:post_type => 'gallery')
      @headlines = @page.posts.where(:post_type => 'headline')
      @files = @page.posts.where(:post_type => 'attachment')
      @blogs = @page.posts.where(:post_type => 'blog')
      @site_layout = Company.first.layout.nil? ? 'default' : Company.first.layout
      @page_layout = @page.layout.nil? ? 'default' : @page.layout
      if params[:page_name]
        @section.pages.where(:name => params[:page_name])
      else
    		@page = @section.pages.first
      end
  		@layout = 'default'
  	end

    def post
      @company = Company.first
      @sections = Section.order('position')
      @section = Section.where(:name => params[:section_name]).first
      @page = params[:page_name].nil? ? @section.pages.first : @section.pages.where(:name => params[:page_name]).first
      @posts = @page.posts
      @post = Post.find(params[:post_id])
      @sliders = @page.posts.where(:post_type => 'slider')
      @images = @page.posts.where(:post_type => 'gallery')
      @headlines = @page.posts.where(:post_type => 'headline')
      @blogs = @page.posts.where(:post_type => 'blog')
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
