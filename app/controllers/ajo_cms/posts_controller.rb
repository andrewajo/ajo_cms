module AjoCms
  class PostsController < ApplicationController
  	layout 'ajo_cms/admin'
  	def new
  		@section = Section.find(params[:section_id])
  		@page = Page.find(params[:page_id])
  		@posts = @page.posts
  		@post = Post.new
  	end

  	def create
  		@post = Post.new(params[:post])
  		if @post.save
  			redirect_to section_page_path(params[:section_id], params[:page_id]), notice: 'Post created!'
  		else
  			render 'new'
  		end
  	end
  end
end
