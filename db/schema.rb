# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2019_12_03_141207) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "shut_the_box_dice_rolls", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.integer "one", default: 0
    t.integer "two", default: 0
    t.integer "three", default: 0
    t.integer "four", default: 0
    t.integer "five", default: 0
    t.integer "six", default: 0
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_shut_the_box_dice_rolls_on_user_id"
  end

  create_table "shut_the_box_games", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.integer "wins", default: 0
    t.integer "losses", default: 0
    t.integer "totalGames", default: 0
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_shut_the_box_games_on_user_id"
  end

  create_table "shut_the_box_roll_sums", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.integer "two", default: 0
    t.integer "three", default: 0
    t.integer "four", default: 0
    t.integer "five", default: 0
    t.integer "six", default: 0
    t.integer "seven", default: 0
    t.integer "eight", default: 0
    t.integer "nine", default: 0
    t.integer "ten", default: 0
    t.integer "eleven", default: 0
    t.integer "twelve", default: 0
    t.integer "totalRolls", default: 0
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_shut_the_box_roll_sums_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "shut_the_box_dice_rolls", "users"
  add_foreign_key "shut_the_box_games", "users"
  add_foreign_key "shut_the_box_roll_sums", "users"
end
