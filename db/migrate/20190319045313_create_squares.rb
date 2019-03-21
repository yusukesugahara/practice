class CreateSquares < ActiveRecord::Migration[5.0]
  def change
    create_table :squares do |t|
      t.references :user, foreign_key: true,null:true
      t.references :group, foreign_key: true,null:true
      t.string :zero
      t.string :one
      t.string :two
      t.string :three
      t.string :four
      t.string :five
      t.string :six
      t.string :seven
      t.string :eight
      t.string :one_one
      t.string :one_two
      t.string :one_three
      t.string :one_four
      t.string :one_five
      t.string :one_six
      t.string :one_seven
      t.string :one_eight
      t.string :two_one
      t.string :two_two
      t.string :two_three
      t.string :two_four
      t.string :two_five
      t.string :two_six
      t.string :two_seven
      t.string :two_eight
      t.string :three_one
      t.string :three_two
      t.string :three_three
      t.string :three_four
      t.string :three_five
      t.string :three_six
      t.string :three_seven
      t.string :three_eight
      t.string :four_one
      t.string :four_two
      t.string :four_three
      t.string :four_four
      t.string :four_five
      t.string :four_six
      t.string :four_seven
      t.string :four_eight
      t.string :five_one
      t.string :five_two
      t.string :five_three
      t.string :five_four
      t.string :five_five
      t.string :five_six
      t.string :five_seven
      t.string :five_eight
      t.string :six_one
      t.string :six_two
      t.string :six_three
      t.string :six_four
      t.string :six_five
      t.string :six_six
      t.string :six_seven
      t.string :six_eight
      t.string :seven_one
      t.string :seven_two
      t.string :seven_three
      t.string :seven_four
      t.string :seven_five
      t.string :seven_six
      t.string :seven_seven
      t.string :seven_eight
      t.string :eight_one
      t.string :eight_two
      t.string :eight_three
      t.string :eight_four
      t.string :eight_five
      t.string :eight_six
      t.string :eight_seven
      t.string :eight_eight
      t.timestamps
    end
  end
end
