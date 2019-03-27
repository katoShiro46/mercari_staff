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

ActiveRecord::Schema.define(version: 20190318060113) do

  create_table "brands", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.boolean  "pick_up",    default: false, null: false
  end

  create_table "categories", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.string   "ancestry"
    t.integer  "size_type_id"
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.boolean  "pick_up",      default: false, null: false
  end

  create_table "deals", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "status",     null: false
    t.integer  "user_id"
    t.integer  "item_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["item_id"], name: "index_deals_on_item_id", using: :btree
    t.index ["user_id"], name: "index_deals_on_user_id", using: :btree
  end

  create_table "item_comments", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.text     "comment",    limit: 65535, null: false
    t.integer  "user_id"
    t.integer  "item_id"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.index ["item_id"], name: "index_item_comments_on_item_id", using: :btree
    t.index ["user_id"], name: "index_item_comments_on_user_id", using: :btree
  end

  create_table "item_images", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "image"
    t.integer  "item_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "items", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name",                          null: false
    t.text     "description",     limit: 65535, null: false
    t.integer  "price",                         null: false
    t.integer  "condition",                     null: false
    t.integer  "shipping_method",               null: false
    t.integer  "shipping_date",                 null: false
    t.integer  "shipping_fee",                  null: false
    t.integer  "prefecture_id",                 null: false
    t.string   "brand"
    t.integer  "size_id"
    t.integer  "category_id"
    t.integer  "vendor_id"
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
    t.index ["category_id"], name: "index_items_on_category_id", using: :btree
    t.index ["vendor_id"], name: "index_items_on_vendor_id", using: :btree
  end

  create_table "size_types", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "sizes", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.integer  "size_type_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "social_profiles", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string  "provider", null: false
    t.string  "uid",      null: false
    t.integer "user_id"
    t.index ["user_id"], name: "index_social_profiles_on_user_id", using: :btree
  end

  create_table "street_addresses", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "post_number"
    t.integer  "prefecture_id"
    t.string   "city"
    t.string   "address"
    t.string   "building_name"
    t.integer  "user_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["user_id"], name: "index_street_addresses_on_user_id", using: :btree
  end

  create_table "users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "nickname",                                                                  null: false
    t.string   "tellphone"
    t.string   "family_name",                                                               null: false
    t.string   "first_name",                                                                null: false
    t.string   "family_name_phonetic",                                                      null: false
    t.string   "first_name_phonetic",                                                       null: false
    t.integer  "birth_year",                                                                null: false
    t.integer  "birth_month",                                                               null: false
    t.integer  "birth_day",                                                                 null: false
    t.string   "icon",                                 default: "member_photo_noimage.png"
    t.text     "profile",                limit: 65535
    t.string   "invitation_code"
    t.string   "email",                                default: "",                         null: false
    t.string   "encrypted_password",                   default: "",                         null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at",                                                                null: false
    t.datetime "updated_at",                                                                null: false
    t.string   "payjp_id"
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  create_table "valuations", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "satisfaction_level",               null: false
    t.text     "comment",            limit: 65535, null: false
    t.integer  "user_id"
    t.integer  "vendor_id"
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
    t.index ["user_id"], name: "index_valuations_on_user_id", using: :btree
    t.index ["vendor_id"], name: "index_valuations_on_vendor_id", using: :btree
  end

  create_table "vendors", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "user_id"
    t.string   "bank"
    t.string   "bank_account"
    t.string   "branch_code"
    t.string   "account_number"
    t.string   "family_name"
    t.string   "first_name"
    t.string   "post_number"
    t.integer  "prefecture_id"
    t.string   "city"
    t.string   "address"
    t.string   "building_name"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
    t.string   "first_name_phonetic"
    t.string   "family_name_phonetic"
    t.index ["user_id"], name: "index_vendors_on_user_id", using: :btree
  end

  add_foreign_key "deals", "items"
  add_foreign_key "deals", "users"
  add_foreign_key "item_comments", "items"
  add_foreign_key "item_comments", "users"
  add_foreign_key "items", "categories"
  add_foreign_key "items", "vendors"
  add_foreign_key "social_profiles", "users"
  add_foreign_key "street_addresses", "users"
  add_foreign_key "valuations", "users"
  add_foreign_key "valuations", "vendors"
  add_foreign_key "vendors", "users"
end
