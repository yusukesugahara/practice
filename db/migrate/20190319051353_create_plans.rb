class CreatePlans < ActiveRecord::Migration[5.0]
  def change
    create_table :plans do |t|
      t.references :user, foreign_key: true,null:true
      t.date :date
      t.string :name
      t.text :text
      t.timestamps
    end
  end
end
