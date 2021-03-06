class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.integer :stars
      t.string :body
      t.references :commenter, null: false
      t.references :commentable, polymorphic: true, index: true, null: false

      t.timestamps null: false
    end
  end
end
