class AddPositionToAjoCmsPost < ActiveRecord::Migration
  def change
    add_column :ajo_cms_posts, :position, :integer
  end
end
