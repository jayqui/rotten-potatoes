class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username
      t.boolean :is_admin
      t.boolean :is_reviewer

      t.timestamps null: false
    end
  end
end
