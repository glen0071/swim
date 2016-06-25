# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20160625211102) do

  create_table "authors", force: :cascade do |t|
    t.string   "name"
    t.date     "birth"
    t.date     "death"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "concepts", force: :cascade do |t|
    t.string   "name"
    t.string   "summary"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "publications", force: :cascade do |t|
    t.string   "name"
    t.integer  "author_id"
    t.date     "publication_year"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  add_index "publications", ["author_id"], name: "index_publications_on_author_id"

  create_table "quotes", force: :cascade do |t|
    t.text     "text"
    t.integer  "publication_id"
    t.integer  "author_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_index "quotes", ["author_id"], name: "index_quotes_on_author_id"
  add_index "quotes", ["publication_id"], name: "index_quotes_on_publication_id"

  create_table "references", force: :cascade do |t|
    t.integer  "quote_id"
    t.integer  "concept_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
