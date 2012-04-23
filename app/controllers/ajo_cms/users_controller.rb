module AjoCms
  class UsersController < ApplicationController
  	layout :resolve_layout
  	before_filter :authenticate, :except => :first_user

  	def index
  		@users = User.all
  	end

  	def new
      @users = User.all
  		@user = User.new
  	end

  	def show
  		@user = User.find(params[:id])
  	end

  	def first_user
  		@user = User.new
  	end

  	def create
  		@user = User.new(params[:user])
  		if @user.save
  			redirect_to root_url, :notice => "Signed up!"
  		else
  			render "new"
  		end
  	end

  	private

  	def resolve_layout
  		case action_name
  		when "first_user"
  			"ajo_cms/login"
  		else
  			"ajo_cms/admin"
  		end
  	end

  end
end
