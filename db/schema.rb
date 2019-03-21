# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20190321012621) do

  create_table "authorities", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "user_id",    null: false
    t.integer  "group_id",   null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["group_id"], name: "index_authorities_on_group_id", using: :btree
    t.index ["user_id"], name: "index_authorities_on_user_id", using: :btree
  end

  create_table "comments", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "user_id",                  null: false
    t.integer  "diary_id",                 null: false
    t.text     "text",       limit: 65535, null: false
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.index ["diary_id"], name: "index_comments_on_diary_id", using: :btree
    t.index ["user_id"], name: "index_comments_on_user_id", using: :btree
  end

  create_table "diaries", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "user_id",                  null: false
    t.integer  "group_id",                 null: false
    t.integer  "square_id"
    t.integer  "plan_id"
    t.text     "text",       limit: 65535
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.index ["group_id"], name: "index_diaries_on_group_id", using: :btree
    t.index ["plan_id"], name: "index_diaries_on_plan_id", using: :btree
    t.index ["square_id"], name: "index_diaries_on_square_id", using: :btree
    t.index ["user_id"], name: "index_diaries_on_user_id", using: :btree
  end

  create_table "groups", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "plans", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.date     "date",       null: false
    t.integer  "number"
    t.integer  "group_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["group_id"], name: "index_plans_on_group_id", using: :btree
  end

  create_table "squares", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "user_id"
    t.string   "zero"
    t.string   "one"
    t.string   "two"
    t.string   "three"
    t.string   "four"
    t.string   "five"
    t.string   "six"
    t.string   "seven"
    t.string   "eight"
    t.string   "one_one"
    t.string   "one_two"
    t.string   "one_three"
    t.string   "one_four"
    t.string   "one_five"
    t.string   "one_six"
    t.string   "one_seven"
    t.string   "one_eight"
    t.string   "two_one"
    t.string   "two_two"
    t.string   "two_three"
    t.string   "two_four"
    t.string   "two_five"
    t.string   "two_six"
    t.string   "two_seven"
    t.string   "two_eight"
    t.string   "three_one"
    t.string   "three_two"
    t.string   "three_three"
    t.string   "three_four"
    t.string   "three_five"
    t.string   "three_six"
    t.string   "three_seven"
    t.string   "three_eight"
    t.string   "four_one"
    t.string   "four_two"
    t.string   "four_three"
    t.string   "four_four"
    t.string   "four_five"
    t.string   "four_six"
    t.string   "four_seven"
    t.string   "four_eight"
    t.string   "five_one"
    t.string   "five_two"
    t.string   "five_three"
    t.string   "five_four"
    t.string   "five_five"
    t.string   "five_six"
    t.string   "five_seven"
    t.string   "five_eight"
    t.string   "six_one"
    t.string   "six_two"
    t.string   "six_three"
    t.string   "six_four"
    t.string   "six_five"
    t.string   "six_six"
    t.string   "six_seven"
    t.string   "six_eight"
    t.string   "seven_one"
    t.string   "seven_two"
    t.string   "seven_three"
    t.string   "seven_four"
    t.string   "seven_five"
    t.string   "seven_six"
    t.string   "seven_seven"
    t.string   "seven_eight"
    t.string   "eight_one"
    t.string   "eight_two"
    t.string   "eight_three"
    t.string   "eight_four"
    t.string   "eight_five"
    t.string   "eight_six"
    t.string   "eight_seven"
    t.string   "eight_eight"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "name"
    t.index ["user_id"], name: "index_squares_on_user_id", using: :btree
  end

  create_table "user_groups", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "group_id",   null: false
    t.integer  "user_id",    null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["group_id"], name: "index_user_groups_on_group_id", using: :btree
    t.index ["user_id"], name: "index_user_groups_on_user_id", using: :btree
  end

  create_table "users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "nickname",               default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  add_foreign_key "authorities", "groups"
  add_foreign_key "authorities", "users"
  add_foreign_key "comments", "diaries"
  add_foreign_key "comments", "users"
  add_foreign_key "diaries", "groups"
  add_foreign_key "diaries", "plans"
  add_foreign_key "diaries", "squares"
  add_foreign_key "diaries", "users"
  add_foreign_key "plans", "groups"
  add_foreign_key "squares", "users"
  add_foreign_key "user_groups", "groups"
  add_foreign_key "user_groups", "users"
end
