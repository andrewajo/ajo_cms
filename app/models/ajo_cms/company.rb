module AjoCms
  class Company < ActiveRecord::Base
  	attr_accessible :logo, :name, :phone, :email, :contact, :fax, :title, :address, :city, :country, :state, :zip_code, :phone, :fax, :email, :layout, :theme

  	mount_uploader :logo, LogoUploader
  end
end
