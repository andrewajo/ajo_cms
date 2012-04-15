class CreateAjoCmsPages < ActiveRecord::Migration
  def change
    create_table :ajo_cms_pages do |t|
      t.string :name
      t.string :title
      t.string :layout
      t.integer :section_id
      t.boolean :index_page

      t.timestamps
    end
  end
end
