class AddLayoutToAjoCmsCompanies < ActiveRecord::Migration
  def change
    add_column :ajo_cms_companies, :layout, :string

  end
end
