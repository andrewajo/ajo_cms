class CreateAjoCmsUsers < ActiveRecord::Migration
  def change
    create_table :ajo_cms_users do |t|
      t.string :email
      t.string :password_digest

      t.timestamps
    end
  end
end
