class CreateAjoCmsSections < ActiveRecord::Migration
  def change
    create_table :ajo_cms_sections do |t|
      t.string :name
      t.string :title

      t.timestamps
    end
  end
end
