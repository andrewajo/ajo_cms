class CreateAjoCmsSubsections < ActiveRecord::Migration
  def change
    create_table :ajo_cms_subsections do |t|
      t.integer :page_id
      t.integer :position
      t.string :layout

      t.timestamps
    end
  end
end
