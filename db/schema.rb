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

ActiveRecord::Schema.define(version: 20150520155911) do

  create_table "stock_purchases", force: :cascade do |t|
    t.integer  "stock_id"
    t.integer  "user_id"
    t.integer  "price"
    t.integer  "original_amount"
    t.integer  "current_amount"
    t.datetime "date"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_index "stock_purchases", ["stock_id"], name: "index_stock_purchases_on_stock_id"
  add_index "stock_purchases", ["user_id"], name: "index_stock_purchases_on_user_id"

  create_table "stock_sells", force: :cascade do |t|
    t.integer  "stock_purchase_id"
    t.integer  "price"
    t.integer  "amount"
    t.datetime "date"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  add_index "stock_sells", ["stock_purchase_id"], name: "index_stock_sells_on_stock_purchase_id"

  create_table "stock_transactions", force: :cascade do |t|
    t.integer  "stock_id"
    t.integer  "user_id"
    t.integer  "price"
    t.string   "type_of"
    t.datetime "date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "stock_transactions", ["stock_id"], name: "index_stock_transactions_on_stock_id"
  add_index "stock_transactions", ["user_id"], name: "index_stock_transactions_on_user_id"

  create_table "stocks", force: :cascade do |t|
    t.string   "symbol"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.integer  "age"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
