class AddPositionToAjoCmsSections < ActiveRecord::Migration
  def change
    add_column :ajo_cms_sections, :position, :integer

  end
end
