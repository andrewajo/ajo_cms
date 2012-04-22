class CreateAjoCmsCompanies < ActiveRecord::Migration
  def change
    create_table :ajo_cms_companies do |t|
      t.string :title
      t.string :name
      t.string :address
      t.string :city
      t.string :state
      t.string :country
      t.string :phone
      t.string :fax
      t.string :email
      t.string :zip_code

      t.timestamps
    end
    AjoCms::Company.create(:name => 'AJO CMS', :title => '', :address => '', :city => '', :state => '', :country => '', :phone => '', :fax => '', :email => '', :zip_code => '')
  end
  
end
