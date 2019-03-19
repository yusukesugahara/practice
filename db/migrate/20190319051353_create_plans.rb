class CreatePlans < ActiveRecord::Migration[5.0]
  def change
    create_table :plans do |t|
      t.date :date ,null: false
      t.integer :number
      t.references :group, foreign_key: true
      t.timestamps
    end
  end
end
