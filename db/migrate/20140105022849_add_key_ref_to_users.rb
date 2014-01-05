class AddKeyRefToUsers < ActiveRecord::Migration
  def change
    add_reference :users, :key, index: true
  end
end
