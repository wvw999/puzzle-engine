class FixJoins < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :current_level
    add_column :users, :puzzle_id, :int, default: 1
    drop_table :reviews_users
    drop_table :destinations_reviews
  end
end
