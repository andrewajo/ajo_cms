class AddContactToAjoCmsCompanies < ActiveRecord::Migration
  def change
    add_column :ajo_cms_companies, :contact, :string

  end
end
