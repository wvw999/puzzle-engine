class Repairboardstorage < ActiveRecord::Migration[5.2]
  def change
    add_column :puzzles, :solution, :string, array: true, default: []
  end
end
