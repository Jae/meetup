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

ActiveRecord::Schema.define(version: 20161215082820) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "events", force: :cascade do |t|
    t.text     "title",                   null: false
    t.text     "address",                 null: false
    t.text     "city",                    null: false
    t.datetime "start_time",              null: false
    t.datetime "end_time"
    t.text     "topics",     default: [],              array: true
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.index ["city", "start_time"], name: "index_events_on_city_and_start_time", using: :btree
    t.index ["topics"], name: "index_events_on_topics", using: :gin
  end

  create_table "preferences", force: :cascade do |t|
    t.integer  "user_id",     null: false
    t.text     "city",        null: false
    t.text     "topic",       null: false
    t.tsrange  "start_times", null: false
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["city", "topic"], name: "index_preferences_on_city_and_topic", using: :btree
    t.index ["start_times"], name: "index_preferences_on_start_times", using: :gist
    t.index ["user_id"], name: "index_preferences_on_user_id", using: :btree
  end

  create_table "sessions", force: :cascade do |t|
    t.text     "token",      null: false
    t.integer  "user_id",    null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["token"], name: "index_sessions_on_token", unique: true, using: :btree
    t.index ["user_id"], name: "index_sessions_on_user_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.text     "email",      null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
  end

  add_foreign_key "preferences", "users"
  add_foreign_key "sessions", "users"
end
