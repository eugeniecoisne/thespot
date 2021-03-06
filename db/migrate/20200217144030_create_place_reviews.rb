class CreatePlaceReviews < ActiveRecord::Migration[6.0]
  def change
    create_table :place_reviews do |t|
      t.text :content
      t.integer :rating
      t.references :place, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
