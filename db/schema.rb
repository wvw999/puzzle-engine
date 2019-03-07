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

ActiveRecord::Schema.define(version: 2019_03_04_215212) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "plays", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "puzzle_id", null: false
    t.string "puzzle_current", default: [], array: true
    t.string "found_words", default: [], array: true
    t.string "remaining_words", default: [], array: true
    t.integer "play_counts"
    t.integer "reward_hints", default: 3
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "puzzles", force: :cascade do |t|
    t.string "board", default: [], array: true
    t.string "words", default: [], array: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "solution", default: [], array: true
  end

  create_table "users", force: :cascade do |t|
    t.string "name", null: false
    t.string "email", null: false
    t.string "password"
    t.boolean "admin"
    t.integer "hints"
    t.integer "score"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "puzzle_id", default: 1
  end

end
