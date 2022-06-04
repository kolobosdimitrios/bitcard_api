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

ActiveRecord::Schema.define(version: 2022_05_30_145313) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "products", force: :cascade do |t|
    t.string "name", null: false
    t.decimal "value"
    t.text "description", null: false
    t.string "code", null: false
    t.string "barcode", null: false
    t.bigint "purchase_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["purchase_id"], name: "index_products_on_purchase_id"
  end

  create_table "purchases", force: :cascade do |t|
    t.decimal "price"
    t.datetime "time"
    t.string "pay_method", null: false
    t.bigint "user_id"
    t.bigint "shop_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["shop_id"], name: "index_purchases_on_shop_id"
    t.index ["user_id"], name: "index_purchases_on_user_id"
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
  end

  create_table "users", force: :cascade do |t|
    t.string "name", null: false
    t.string "surname", null: false
    t.string "username", null: false
    t.string "user_id", null: false
    t.date "date_of_birth", null: false
    t.string "address", null: false
    t.string "email", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["user_id"], name: "index_users_on_user_id", unique: true
    t.index ["username"], name: "index_users_on_username", unique: true
  end

  add_foreign_key "products", "purchases"
  add_foreign_key "purchases", "users"
end
