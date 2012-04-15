class AddLogoToAjoCmsCompanies < ActiveRecord::Migration
  def change
    add_column :ajo_cms_companies, :logo, :string

  end
end
