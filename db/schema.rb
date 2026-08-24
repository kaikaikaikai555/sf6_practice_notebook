# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.2].define(version: 2026_08_24_075658) do
  create_table "character_notes", force: :cascade do |t|
    t.integer "user_id", null: false
    t.string "opponent_character"
    t.string "my_character"
    t.string "quick_summary"
    t.text "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "my_focus"
    t.text "bad_habit"
    t.text "key_point"
    t.index ["user_id"], name: "index_character_notes_on_user_id"
  end

  create_table "defeat_tags", force: :cascade do |t|
    t.integer "user_id", null: false
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_defeat_tags_on_user_id"
  end

  create_table "match_log_defeat_tags", force: :cascade do |t|
    t.integer "match_log_id", null: false
    t.integer "defeat_tag_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["defeat_tag_id"], name: "index_match_log_defeat_tags_on_defeat_tag_id"
    t.index ["match_log_id"], name: "index_match_log_defeat_tags_on_match_log_id"
  end

  create_table "match_logs", force: :cascade do |t|
    t.integer "user_id", null: false
    t.string "opponent_character"
    t.string "result"
    t.text "memo"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_match_logs_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "character_notes", "users"
  add_foreign_key "defeat_tags", "users"
  add_foreign_key "match_log_defeat_tags", "defeat_tags"
  add_foreign_key "match_log_defeat_tags", "match_logs"
  add_foreign_key "match_logs", "users"
end
