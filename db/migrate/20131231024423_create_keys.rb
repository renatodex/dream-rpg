class CreateKeys < ActiveRecord::Migration
  def change
    create_table :keys do |t|
      t.string :label
      t.integer :slots
      t.date :expiration_date
      t.date :disabled_at

      t.timestamps
    end
  end
end
