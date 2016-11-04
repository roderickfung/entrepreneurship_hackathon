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

ActiveRecord::Schema.define(version: 20161101063442) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "events", force: :cascade do |t|
    t.string   "title"
    t.string   "description"
    t.date     "start_date"
    t.date     "end_date"
    t.string   "aasm_state"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["aasm_state", "start_date", "end_date"], name: "index_events_on_aasm_state_and_start_date_and_end_date", using: :btree
    t.index ["title", "description"], name: "index_events_on_title_and_description", using: :btree
  end

  create_table "locations", force: :cascade do |t|
    t.string   "address"
    t.string   "postal_code"
    t.integer  "event_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["event_id"], name: "index_locations_on_event_id", using: :btree
  end

  create_table "participants", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.integer  "event_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean  "paid"
    t.index ["event_id"], name: "index_participants_on_event_id", using: :btree
  end

  create_table "speakers", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "title"
    t.string   "email"
    t.text     "description"
    t.string   "twitter"
    t.string   "linkedin"
    t.string   "website"
    t.string   "image"
    t.integer  "event_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["event_id"], name: "index_speakers_on_event_id", using: :btree
    t.index ["first_name", "last_name"], name: "index_speakers_on_first_name_and_last_name", using: :btree
    t.index ["image", "description"], name: "index_speakers_on_image_and_description", using: :btree
  end

  create_table "sponsors", force: :cascade do |t|
    t.string   "company_name"
    t.string   "description"
    t.string   "logo"
    t.string   "representative"
    t.integer  "event_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.index ["event_id"], name: "index_sponsors_on_event_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "password_digest"
    t.boolean  "admin"
    t.boolean  "activated"
    t.string   "auth_token"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.index ["email", "auth_token"], name: "index_users_on_email_and_auth_token", using: :btree
  end

  add_foreign_key "locations", "events"
  add_foreign_key "participants", "events"
  add_foreign_key "speakers", "events"
  add_foreign_key "sponsors", "events"
end
