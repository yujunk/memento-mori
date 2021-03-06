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

ActiveRecord::Schema.define(version: 20180402050448) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "contacts", force: :cascade do |t|
    t.string "first_name", null: false
    t.string "last_name", null: false
    t.string "birthdate"
    t.bigint "phone_number", null: false
    t.string "email", null: false
    t.string "address"
    t.string "city"
    t.string "postcode"
    t.string "relationship"
    t.string "notes"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.index ["user_id"], name: "index_contacts_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", null: false
    t.string "first_name", null: false
    t.string "last_name", null: false
    t.string "password_digest"
    t.string "password_confirmation"
    t.string "session_token", limit: 128
    t.integer "role", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email"
    t.index ["session_token"], name: "index_users_on_session_token"
  end

  create_table "vital_documents", force: :cascade do |t|
    t.string "identification_number"
    t.string "first_name"
    t.string "last_name"
    t.string "middle_name"
    t.integer "document_type", default: 0
    t.string "license_class"
    t.date "issue_date"
    t.date "expiration_date"
    t.string "place_of_issue"
    t.string "country_of_issue"
    t.string "paperwork_location", null: false
    t.text "instructions"
    t.text "doc_uploads", default: [], array: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.index ["user_id"], name: "index_vital_documents_on_user_id"
  end

  add_foreign_key "contacts", "users"
  add_foreign_key "vital_documents", "users"
end
