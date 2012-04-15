module AjoCms
  class CompaniesController < ApplicationController
	def show
  		@company = Company.first
	end

	def edit
		@company = Company.find(params[:id])
	end

	def update
		@company = Company.find(params[:id])

		if @company.update_attributes(params[:company])
			redirect_to company_path(@company), notice: "Settings Updated"
		else
			render :action => :edit
		end
	end
  end
end
