class FixSolution < ActiveRecord::Migration[5.2]
  def change
    remove_column :puzzles, :solution, :string
    add_column :puzzles, :solution, :string
  end
end
