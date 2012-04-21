class AddThemeToCompany < ActiveRecord::Migration
  def change
    add_column :companies, :theme, :string
  end
end
