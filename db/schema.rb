# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2023_03_11_122357) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "coupons", force: :cascade do |t|
    t.decimal "value"
    t.string "code"
    t.integer "redeemed"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "user_id"
    t.index ["user_id"], name: "index_coupons_on_user_id"
  end

  create_table "products", force: :cascade do |t|
    t.string "name", null: false
    t.decimal "value"
    t.text "description", null: false
    t.string "code", null: false
    t.string "barcode", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "shops_id"
    t.binary "image"
    t.integer "points", default: 0
    t.index ["shops_id"], name: "index_products_on_shops_id"
  end

  create_table "purchases", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "tokens_id"
    t.bigint "products_id"
    t.bigint "shops_id"
    t.index ["products_id"], name: "index_purchases_on_products_id"
    t.index ["shops_id"], name: "index_purchases_on_shops_id"
    t.index ["tokens_id"], name: "index_purchases_on_tokens_id"
  end

  create_table "shops", force: :cascade do |t|
    t.string "shop_name", null: false
    t.string "location_name", null: false
    t.float "location_latitude", null: false
    t.float "location_longitude", null: false
    t.text "description", null: false
    t.string "location_address", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "working_hours", default: "{}"
  end

  create_table "tokens", force: :cascade do |t|
    t.string "token", null: false
    t.bigint "user_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_tokens_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name", null: false
    t.string "surname", null: false
    t.string "username", null: false
    t.string "user_key", null: false
    t.date "date_of_birth", null: false
    t.string "address", null: false
    t.string "email", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.binary "image"
    t.integer "points", default: 0
    t.integer "remaining_points", default: 0
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["user_key"], name: "index_users_on_user_key", unique: true
    t.index ["username"], name: "index_users_on_username", unique: true
  end

  add_foreign_key "coupons", "users"
  add_foreign_key "products", "shops", column: "shops_id"
  add_foreign_key "purchases", "products", column: "products_id"
  add_foreign_key "purchases", "shops", column: "shops_id"
  add_foreign_key "purchases", "tokens", column: "tokens_id"
  add_foreign_key "tokens", "users"
end
