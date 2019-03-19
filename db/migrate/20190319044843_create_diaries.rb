class CreateDiaries < ActiveRecord::Migration[5.0]
  def change
    create_table :diaries do |t|
      t.references :user, foreign_key: true, null: false
      t.references :group, foreign_key: true, null: false
      t.references :square, foreign_key: true
      t.references :plan, foreign_key: true
      t.text :text
      t.timestamps
    end
  end
end
