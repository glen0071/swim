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

ActiveRecord::Schema.define(version: 20160622151558) do

  create_table "authors", force: :cascade do |t|
    t.string   "name"
    t.date     "birth"
    t.date     "death"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "quotes", force: :cascade do |t|
    t.text     "text"
    t.integer  "work_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "quotes", ["work_id"], name: "index_quotes_on_work_id"

  create_table "works", force: :cascade do |t|
    t.string   "name"
    t.integer  "author_id"
    t.date     "publication_year"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  add_index "works", ["author_id"], name: "index_works_on_author_id"

end
