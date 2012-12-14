class RemoveLayoutFromAjoCmsPages < ActiveRecord::Migration
  def up
    remove_column :ajo_cms_pages, :layout
  end

  def down
    add_column :ajo_cms_pages, :layout, :string
  end
end
