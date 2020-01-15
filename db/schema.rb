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

ActiveRecord::Schema.define(version: 2020_01_13_153159) do

  create_table "addresses", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "postal_code"
    t.string "prefecture"
    t.string "city"
    t.string "address"
    t.string "building_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.index ["user_id"], name: "index_addresses_on_user_id"
  end

  create_table "brands", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "brand", null: false
    t.bigint "brand_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["brand_id"], name: "index_brands_on_brand_id"
  end

  create_table "categories", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "category", null: false
    t.integer "tree_parent"
    t.bigint "category_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["category_id"], name: "index_categories_on_category_id"
  end

  create_table "conditions", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "condition", null: false
    t.bigint "condition_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["condition_id"], name: "index_conditions_on_condition_id"
  end

  create_table "delivery_areas", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "delivery_area", null: false
    t.bigint "delivery_area_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["delivery_area_id"], name: "index_delivery_areas_on_delivery_area_id"
  end

  create_table "estimated_shipping_dates", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "estimated_shipping_date", null: false
    t.bigint "estimated_shipping_date_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["estimated_shipping_date_id"], name: "index_estimated_shipping_dates_on_estimated_shipping_date_id"
  end

  create_table "images", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "image", limit: 10, null: false
    t.string "item_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "items", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name", limit: 40, null: false
    t.integer "price", null: false
    t.text "description", null: false
    t.bigint "image_id", null: false
    t.bigint "size_id", null: false
    t.bigint "condition_id", null: false
    t.bigint "shipping_charge_id", null: false
    t.bigint "shipping_method_id", null: false
    t.bigint "delivery_area_id", null: false
    t.bigint "status_id", null: false
    t.bigint "estimated_shipping_date_id", null: false
    t.bigint "category_id", null: false
    t.bigint "brand_id", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["brand_id"], name: "index_items_on_brand_id"
    t.index ["category_id"], name: "index_items_on_category_id"
    t.index ["condition_id"], name: "index_items_on_condition_id"
    t.index ["delivery_area_id"], name: "index_items_on_delivery_area_id"
    t.index ["estimated_shipping_date_id"], name: "index_items_on_estimated_shipping_date_id"
    t.index ["image_id"], name: "index_items_on_image_id"
    t.index ["shipping_charge_id"], name: "index_items_on_shipping_charge_id"
    t.index ["shipping_method_id"], name: "index_items_on_shipping_method_id"
    t.index ["size_id"], name: "index_items_on_size_id"
    t.index ["status_id"], name: "index_items_on_status_id"
    t.index ["user_id"], name: "index_items_on_user_id"
  end

  create_table "payments", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "customer_id", null: false
    t.string "card_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_payments_on_user_id"
  end

  create_table "products", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "delivery_area", default: 0, null: false
  end

  create_table "shipping_charges", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "shipping_charge", null: false
    t.bigint "shipping_charge_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["shipping_charge_id"], name: "index_shipping_charges_on_shipping_charge_id"
  end

  create_table "shipping_methods", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "shipping_method", null: false
    t.bigint "shipping_method_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["shipping_method_id"], name: "index_shipping_methods_on_shipping_method_id"
  end

  create_table "sizes", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "size", null: false
    t.bigint "size_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["size_id"], name: "index_sizes_on_size_id"
  end

  create_table "statuses", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "status", null: false
    t.bigint "status_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["status_id"], name: "index_statuses_on_status_id"
  end

  create_table "users", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "addresses", "users"
  add_foreign_key "brands", "brands"
  add_foreign_key "categories", "categories"
  add_foreign_key "conditions", "conditions"
  add_foreign_key "delivery_areas", "delivery_areas"
  add_foreign_key "estimated_shipping_dates", "estimated_shipping_dates"
  add_foreign_key "items", "brands"
  add_foreign_key "items", "categories"
  add_foreign_key "items", "conditions"
  add_foreign_key "items", "delivery_areas"
  add_foreign_key "items", "estimated_shipping_dates"
  add_foreign_key "items", "images"
  add_foreign_key "items", "shipping_charges"
  add_foreign_key "items", "shipping_methods"
  add_foreign_key "items", "sizes"
  add_foreign_key "items", "statuses"
  add_foreign_key "items", "users"
  add_foreign_key "payments", "users"
  add_foreign_key "shipping_charges", "shipping_charges"
  add_foreign_key "shipping_methods", "shipping_methods"
  add_foreign_key "sizes", "sizes"
  add_foreign_key "statuses", "statuses"
end
