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

ActiveRecord::Schema.define(version: 20180730134131) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "authors", force: :cascade do |t|
    t.string   "name"
    t.date     "birth"
    t.date     "death"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.date     "start"
    t.date     "end"
  end

  create_table "concepts", force: :cascade do |t|
    t.string   "name"
    t.string   "summary"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "user_id"
    t.index ["user_id"], name: "index_concepts_on_user_id", using: :btree
  end

  create_table "quotes", force: :cascade do |t|
    t.text     "text"
    t.integer  "author_id"
    t.integer  "writing_id"
    t.text     "attribution"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "user_id"
    t.index ["author_id"], name: "index_quotes_on_author_id", using: :btree
    t.index ["user_id"], name: "index_quotes_on_user_id", using: :btree
    t.index ["writing_id"], name: "index_quotes_on_writing_id", using: :btree
  end

  create_table "references", force: :cascade do |t|
    t.integer  "quote_id"
    t.integer  "concept_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "user_id"
    t.index ["user_id"], name: "index_references_on_user_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  create_table "writings", force: :cascade do |t|
    t.string  "title"
    t.string  "alt_title"
    t.string  "publications"
    t.integer "author_id"
    t.integer "user_id"
    t.string  "date"
    t.string  "location"
    t.text    "notes"
    t.index ["author_id"], name: "index_writings_on_author_id", using: :btree
    t.index ["user_id"], name: "index_writings_on_user_id", using: :btree
  end

  add_foreign_key "concepts", "users"
  add_foreign_key "quotes", "authors"
  add_foreign_key "quotes", "users"
  add_foreign_key "quotes", "writings"
  add_foreign_key "references", "users"
  add_foreign_key "writings", "authors"
  add_foreign_key "writings", "users"
end
