class AddThemeToAjoCmsCompanies < ActiveRecord::Migration
  def change
    add_column :ajo_cms_companies, :theme, :string
  end
end
