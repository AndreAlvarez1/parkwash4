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

ActiveRecord::Schema.define(version: 2019_01_24_231243) do

  create_table "active_admin_comments", force: :cascade do |t|
    t.string "namespace"
    t.text "body"
    t.string "resource_type"
    t.integer "resource_id"
    t.string "author_type"
    t.integer "author_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id"
    t.index ["namespace"], name: "index_active_admin_comments_on_namespace"
    t.index ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id"
  end

  create_table "admin_users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_admin_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true
  end

  create_table "cards", force: :cascade do |t|
    t.integer "user_id"
    t.boolean "active"
    t.boolean "erased"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "number"
    t.index ["user_id"], name: "index_cards_on_user_id"
  end

  create_table "credit_notes", force: :cascade do |t|
    t.date "creation_date"
    t.integer "informed_gross_amount"
    t.string "sii_status"
    t.integer "receipt_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["receipt_id"], name: "index_credit_notes_on_receipt_id"
  end

  create_table "payments", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.date "charged_date"
    t.string "method"
    t.integer "paid_amount"
    t.integer "user_id"
    t.integer "receipt_id"
    t.index ["receipt_id"], name: "index_payments_on_receipt_id"
    t.index ["user_id"], name: "index_payments_on_user_id"
  end

  create_table "places", force: :cascade do |t|
    t.string "address"
    t.string "commune"
    t.string "city"
    t.string "contact_name"
    t.string "contact_cellphone"
    t.string "contact_email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
  end

  create_table "prices", force: :cascade do |t|
    t.integer "place_id"
    t.integer "wash_type_id"
    t.integer "vehicle_size_id"
    t.integer "gross_amount"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["place_id"], name: "index_prices_on_place_id"
    t.index ["vehicle_size_id"], name: "index_prices_on_vehicle_size_id"
    t.index ["wash_type_id"], name: "index_prices_on_wash_type_id"
  end

  create_table "receipts", force: :cascade do |t|
    t.date "creation_date"
    t.integer "informed_gross_amount"
    t.integer "total_discount_amount"
    t.string "sii_status"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_receipts_on_user_id"
  end

  create_table "reconciliations", force: :cascade do |t|
    t.integer "payment_id"
    t.integer "receipt_id"
    t.integer "amount_assigned_from_payment_to_receipt"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["payment_id"], name: "index_reconciliations_on_payment_id"
    t.index ["receipt_id"], name: "index_reconciliations_on_receipt_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "rut"
    t.string "first_name"
    t.string "last_name"
    t.string "cellphone"
    t.string "city"
    t.boolean "card_status"
    t.string "transdata_id"
    t.string "provider"
    t.string "uid"
    t.string "gender"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "vehicle_sizes", force: :cascade do |t|
    t.string "code"
    t.string "name"
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "vehicles", force: :cascade do |t|
    t.string "patent"
    t.string "vehicle_type"
    t.string "brand"
    t.string "model"
    t.string "color"
    t.boolean "status"
    t.integer "user_id"
    t.integer "vehicle_size_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "place_id"
    t.index ["user_id"], name: "index_vehicles_on_user_id"
    t.index ["vehicle_size_id"], name: "index_vehicles_on_vehicle_size_id"
  end

  create_table "wash_types", force: :cascade do |t|
    t.string "code"
    t.string "name"
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "washers", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "rut"
    t.string "first_name"
    t.string "last_name"
    t.string "cellphone"
    t.string "city"
    t.integer "role"
    t.index ["email"], name: "index_washers_on_email", unique: true
    t.index ["reset_password_token"], name: "index_washers_on_reset_password_token", unique: true
  end

  create_table "washes", force: :cascade do |t|
    t.date "creation_date"
    t.integer "discount_amount"
    t.integer "wash_type_id"
    t.integer "washer_id"
    t.integer "vehicle_id"
    t.integer "receipt_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "receipt_assigned_amount_to_wash"
    t.index ["receipt_id"], name: "index_washes_on_receipt_id"
    t.index ["vehicle_id"], name: "index_washes_on_vehicle_id"
    t.index ["wash_type_id"], name: "index_washes_on_wash_type_id"
    t.index ["washer_id"], name: "index_washes_on_washer_id"
  end

end
