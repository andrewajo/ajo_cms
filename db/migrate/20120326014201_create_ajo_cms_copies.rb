class CreateAjoCmsCopies < ActiveRecord::Migration
  def change
    create_table :ajo_cms_copies do |t|
      t.string :title
      t.text :content
      t.integer :section_id

      t.timestamps
    end
  end
end
