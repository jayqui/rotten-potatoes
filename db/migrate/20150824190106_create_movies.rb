class CreateMovies < ActiveRecord::Migration
  def change
    create_table :movies do |t|
      t.integer :admin_id, null: false
      t.string :title, null: false
      t.string :tagline
      t.string :image_url
      t.string :director
      t.string :producer
      t.string :description
      t.integer :authorized_reviewer_id

      t.timestamps null: false
    end
  end
end
