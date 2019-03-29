class FixBoard < ActiveRecord::Migration[5.2]
  def change
    remove_column :puzzles, :board, :string
    add_column :puzzles, :board, :string
  end
end
