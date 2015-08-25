class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :username
      t.string :password_digest
      t.boolean :is_admin
      t.boolean :has_pro_permissions

      t.timestamps null: false
    end
  end
end
