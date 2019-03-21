class AddColumonToSquares < ActiveRecord::Migration[5.0]
  def change
    add_column :squares, :name, :string
  end
end
