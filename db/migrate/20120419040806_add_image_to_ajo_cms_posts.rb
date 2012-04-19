class AddImageToAjoCmsPosts < ActiveRecord::Migration
  def change
    add_column :ajo_cms_posts, :image, :string

  end
end
