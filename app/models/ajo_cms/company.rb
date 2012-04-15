module AjoCms
  class Company < ActiveRecord::Base
  	attr_accessible :logo, :name, :phone, :email, :contact, :fax, :title, :address, :city, :country, :state, :zip_code
  	mount_uploader :logo, LogoUploader
  end
end
