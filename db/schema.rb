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

ActiveRecord::Schema[7.0].define(version: 2023_06_26_123537) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bars", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.string "address"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "bookings", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "event_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["event_id"], name: "index_bookings_on_event_id"
    t.index ["user_id"], name: "index_bookings_on_user_id"
  end

  create_table "events", force: :cascade do |t|
    t.datetime "date"
    t.bigint "pubcrawl_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["pubcrawl_id"], name: "index_events_on_pubcrawl_id"
  end

  create_table "games", force: :cascade do |t|
    t.string "title"
    t.text "rules"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "pubcrawls", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.string "location"
    t.string "category"
    t.integer "nb_max"
    t.bigint "first_bar_id", null: false
    t.bigint "middle_bar_id", null: false
    t.bigint "last_bar_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["first_bar_id"], name: "index_pubcrawls_on_first_bar_id"
    t.index ["last_bar_id"], name: "index_pubcrawls_on_last_bar_id"
    t.index ["middle_bar_id"], name: "index_pubcrawls_on_middle_bar_id"
  end

  create_table "reviews", force: :cascade do |t|
    t.integer "rating"
    t.text "comment"
    t.bigint "user_id", null: false
    t.bigint "event_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["event_id"], name: "index_reviews_on_event_id"
    t.index ["user_id"], name: "index_reviews_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "bookings", "events"
  add_foreign_key "bookings", "users"
  add_foreign_key "events", "pubcrawls"
  add_foreign_key "pubcrawls", "bars", column: "first_bar_id"
  add_foreign_key "pubcrawls", "bars", column: "last_bar_id"
  add_foreign_key "pubcrawls", "bars", column: "middle_bar_id"
  add_foreign_key "reviews", "events"
  add_foreign_key "reviews", "users"
end
