class CreateAjoCmsPosts < ActiveRecord::Migration
  def change
    create_table :ajo_cms_posts do |t|
      t.string :title
      t.text :content
      t.string :post_type
      t.integer :page_id

      t.timestamps
    end
  end
end
