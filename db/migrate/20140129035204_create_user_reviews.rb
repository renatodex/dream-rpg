class CreateUserReviews < ActiveRecord::Migration
  def change
    create_table :user_reviews do |t|
      t.references :review, index: true
      t.references :user, index: true
      t.boolean :liked

      t.timestamps
    end
  end
end
