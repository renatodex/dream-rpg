class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.string :name
      t.boolean :is_playing
      t.float :rating
      t.string :image_url

      t.timestamps
    end
  end
end
