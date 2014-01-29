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

ActiveRecord::Schema.define(version: 20140129030854) do

  create_table "import_line_items", force: true do |t|
    t.integer  "import_id"
    t.string   "purchaser_name"
    t.string   "item_description"
    t.integer  "item_price_in_cents"
    t.integer  "purchase_count"
    t.string   "merchant_address"
    t.string   "merchant_name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "import_line_items", ["import_id"], name: "index_import_line_items_on_import_id"

  create_table "imports", force: true do |t|
    t.string   "data"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
