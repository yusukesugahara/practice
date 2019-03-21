class RemoveGroupFromSquares < ActiveRecord::Migration[5.0]
  def change
    remove_reference :squares, :group, foreign_key: true
  end
end
