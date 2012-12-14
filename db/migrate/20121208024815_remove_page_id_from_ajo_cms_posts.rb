class RemovePageIdFromAjoCmsPosts < ActiveRecord::Migration
  def up
    remove_column :ajo_cms_posts, :page_id
    add_column :ajo_cms_posts, :subsection_id, :integer
  end

  def down
    add_column :ajo_cms_posts, :page_id, :integer
    remove_column :ajo_cms_posts, :subsection_id
  end
end
