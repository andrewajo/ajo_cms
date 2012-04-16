module AjoCms
  class ApplicationController < ActionController::Base
  	before_filter :first_user
  	before_filter :current_user
  	before_filter :authenticate
  	@@company = Company.first

  	

  	private
	
	def authenticate
		unless @current_user || User.count < 1
			redirect_to new_session_path
		end
	end

	def current_user
		@current_user ||= User.find(session[:user_id]) if session[:user_id]
	end

	def first_user
		if User.count < 1
			redirect_to first_user_users_path
		end
	end

	

	helper_method :current_user
  end
end
