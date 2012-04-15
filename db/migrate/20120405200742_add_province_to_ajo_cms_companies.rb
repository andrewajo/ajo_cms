class AddProvinceToAjoCmsCompanies < ActiveRecord::Migration
  def change
    add_column :ajo_cms_companies, :province, :string

  end
end
