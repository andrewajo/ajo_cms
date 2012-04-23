module AjoCms
  class PostsController < ApplicationController
  	layout 'ajo_cms/admin'
  	def new
  		@section = Section.find(params[:section_id])
  		@page = Page.find(params[:page_id])
  		@posts = @page.posts
      @sliders = @page.posts.where(:post_type => 'slider')
      @headlines = @page.posts.where(:post_type => 'headlines')
      @images = @page.posts.where(:post_type => 'gallery')
  		@post = Post.new
  	end

    def edit
      @section = Section.find(params[:section_id])
      @page = Page.find(params[:page_id])
      @posts = @page.posts
      @sliders = @page.posts.where(:post_type => 'slider')
      @headlines = @page.posts.where(:post_type => 'headlines')
      @images = @page.posts.where(:post_type => 'gallery')
      @post = Post.find(params[:id])
    end

    def show
      @section = Section.find(params[:section_id])
      @page = Page.find(params[:page_id])
      @posts = @page.posts
      @post = Post.find(params[:id])
      @sliders = @page.posts.where(:post_type => 'slider')
      @headlines = @page.posts.where(:post_type => 'headlines')
      @images = @page.posts.where(:post_type => 'gallery')
    end


  	def create
  		@post = Post.new(params[:post])
  		if @post.save
  			redirect_to section_page_path(params[:section_id], params[:page_id]), notice: 'Post created!'
  		else
  			render 'new'
  		end
  	end

    def update
      @post = Post.find(params[:id])
      if @post.update_attributes(params[:post])
        redirect_to section_page_path(params[:section_id], params[:page_id], notice: 'Post updated!')
      else
        render 'edit'
      end
    end

    def destroy
      @post = Post.find(params[:id])
      @post.destroy()

      redirect_to section_page_path(params[:section_id], params[:page_id])
    end
  end
end
