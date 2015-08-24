class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.integer :stars
      t.string :title
      t.text :body
      t.boolean :thumb_is_up
      t.references :reviewer
      t.references :movie

      t.timestamps null: false
    end
  end
end
