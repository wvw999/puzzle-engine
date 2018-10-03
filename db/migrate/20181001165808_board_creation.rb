class BoardCreation < ActiveRecord::Migration[5.2]
  def change
    create_table :puzzles do |t|
      t.string   :board, array: true, default: []
      t.string   :words, array: true, default: []
      t.timestamps
    end
    create_table :users do |t|
      t.string   :name,     null: false
      t.string   :email,   null: false
      t.string   :password
      t.boolean  :admin
      t.integer  :hints
      t.integer  :current_level, default: 1
      t.integer  :score
      t.timestamps
    end
    create_table :plays do |t|
      t.integer  :user_id,     null: false
      t.integer  :puzzle_id,   null: false
      t.string   :puzzle_current, array: true, default: []
      t.string   :found_words, array: true, default: []
      t.string   :remaining_words, array: true, default: []
      t.integer  :play_counts
      t.integer  :reward_hints, default: 3
      t.timestamps
    end
    create_join_table :destinations, :reviews
    create_join_table :reviews, :users
  end
end
