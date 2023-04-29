# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2023_04_28_045850) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "customers", force: :cascade do |t|
    t.string "name"
    t.string "address"
    t.string "phone"
    t.string "email"
    t.string "nationality"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "glass_items", force: :cascade do |t|
    t.bigint "order_id", null: false
    t.string "item_sequential_num", null: false
    t.float "width"
    t.float "height"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["item_sequential_num"], name: "index_glass_items_on_item_sequential_num", unique: true
    t.index ["order_id"], name: "index_glass_items_on_order_id"
  end

  create_table "orders", force: :cascade do |t|
    t.string "num_order", null: false
    t.bigint "customer_id", null: false
    t.datetime "order_date"
    t.string "status", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["customer_id"], name: "index_orders_on_customer_id"
    t.index ["num_order"], name: "index_orders_on_num_order", unique: true
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "user_name", null: false
    t.string "email", null: false
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["user_name"], name: "index_users_on_user_name", unique: true
  end

  add_foreign_key "glass_items", "orders"
  add_foreign_key "orders", "customers"
end
