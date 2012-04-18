class AddPositionToAjoCmsPages < ActiveRecord::Migration
  def change
    add_column :ajo_cms_pages, :position, :integer

  end
end
