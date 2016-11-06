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

ActiveRecord::Schema.define(version: 20161013041242) do

  create_table "contacts", force: :cascade do |t|
    t.string   "email",      limit: 255
    t.string   "phone",      limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "images", force: :cascade do |t|
    t.integer  "category",    limit: 4
    t.string   "filename",    limit: 255
    t.string   "description", limit: 255
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "levels", force: :cascade do |t|
    t.string   "display_name", limit: 255
    t.string   "description",  limit: 512
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  create_table "products", force: :cascade do |t|
    t.string   "name",         limit: 255
    t.string   "upc_code",     limit: 255
    t.string   "product_code", limit: 255
    t.datetime "sell_by_date"
    t.integer  "image_id",     limit: 4
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  add_index "products", ["image_id"], name: "index_products_on_image_id", using: :btree

  create_table "products_and_purchases", id: false, force: :cascade do |t|
    t.integer "product_id",  limit: 4
    t.integer "purchase_id", limit: 4
  end

  add_index "products_and_purchases", ["product_id"], name: "index_products_and_purchases_on_product_id", using: :btree
  add_index "products_and_purchases", ["purchase_id"], name: "index_products_and_purchases_on_purchase_id", using: :btree

  create_table "purchases", force: :cascade do |t|
    t.integer  "region_id",  limit: 4
    t.integer  "user_id",    limit: 4
    t.datetime "date"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  add_index "purchases", ["region_id"], name: "index_purchases_on_region_id", using: :btree
  add_index "purchases", ["user_id"], name: "index_purchases_on_user_id", using: :btree

  create_table "recalls", force: :cascade do |t|
    t.integer  "product_id", limit: 4
    t.string   "reason",     limit: 255
    t.integer  "level_id",   limit: 4
    t.integer  "region_id",  limit: 4
    t.integer  "contact_id", limit: 4
    t.datetime "date"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "recalls", ["contact_id"], name: "index_recalls_on_contact_id", using: :btree
  add_index "recalls", ["level_id"], name: "index_recalls_on_level_id", using: :btree
  add_index "recalls", ["product_id"], name: "index_recalls_on_product_id", using: :btree
  add_index "recalls", ["region_id"], name: "index_recalls_on_region_id", using: :btree

  create_table "regions", force: :cascade do |t|
    t.string   "display_name", limit: 255
    t.integer  "image_id",     limit: 4
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  add_index "regions", ["image_id"], name: "index_regions_on_image_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.integer  "contact_id", limit: 4
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  add_index "users", ["contact_id"], name: "index_users_on_contact_id", using: :btree

  add_foreign_key "products", "images"
  add_foreign_key "purchases", "regions"
  add_foreign_key "purchases", "users"
  add_foreign_key "recalls", "contacts"
  add_foreign_key "recalls", "levels"
  add_foreign_key "recalls", "products"
  add_foreign_key "recalls", "regions"
  add_foreign_key "regions", "images"
  add_foreign_key "users", "contacts"
end
