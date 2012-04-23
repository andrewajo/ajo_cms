class AddDateToAjoCmsPosts < ActiveRecord::Migration
  def change
    add_column :ajo_cms_posts, :date, :date
  end
end
