class CreateReviewTags < ActiveRecord::Migration
  def change
    create_table :review_tags do |t|
      t.string :name
      t.integer :value
      t.references :review, index: true

      t.timestamps
    end
  end
end
