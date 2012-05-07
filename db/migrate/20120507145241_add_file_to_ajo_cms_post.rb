class AddFileToAjoCmsPost < ActiveRecord::Migration
  def change
    add_column :ajo_cms_posts, :file, :string
  end
end
