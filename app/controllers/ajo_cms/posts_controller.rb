module AjoCms
  class PostsController < ApplicationController
  	layout 'ajo_cms/admin'
    before_filter :set_defaults

    def set_defaults
      @section = Section.find(params[:section_id])
      @page = Page.find(params[:page_id])
      @subsection = Subsection.find(params[:subsection_id])
      @sections = Section.all
    end
  	def new
  		@post = Post.new
  	end

    def edit
      @section = Section.find(params[:section_id])
      @page = Page.find(params[:page_id])
      @subsection = Subsection.find(params[:subsection_id])
      @post = Post.find(params[:id])
    end

    def show
      @section = Section.find(params[:section_id])
      @page = Page.find(params[:page_id])
      @posts = @page.posts
      @post = Post.find(params[:id])
      @sliders = @page.posts.where(:post_type => 'slider')
      @headlines = @page.posts.where(:post_type => 'headlines')
      @blogs = @page.posts.where(:post_type => 'blogs')
      @images = @page.posts.where(:post_type => 'gallery')
    end


  	def create
      @sections = Section.all
  		@post = Post.new(params[:post])

  		if @post.save
        if params[:post][:image].present? && (params[:post][:post_type] == 'slider' || params[:post][:post_type == 'text'])
          render :crop
        else
          redirect_to section_page_path(params[:section_id], params[:page_id]), notice: 'Post created!'
        end
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
