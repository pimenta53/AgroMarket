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

ActiveRecord::Schema.define(version: 20131111125231) do

  create_table "ad_images", force: true do |t|
    t.integer  "ad_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
  end

  create_table "admin_testes", force: true do |t|
    t.integer  "coisas"
    t.string   "coisas2"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "admin_tests", force: true do |t|
    t.integer  "coisas"
    t.string   "coisas2"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "ads", force: true do |t|
    t.string   "title"
    t.string   "description"
    t.float    "price"
    t.datetime "expire_date"
    t.string   "location"
    t.binary   "is_active"
    t.integer  "type_price_id"
    t.integer  "city_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
    t.string   "permanent_link"
    t.integer  "category_id",                null: false
    t.integer  "page_views",     default: 0
  end

  create_table "categories", force: true do |t|
    t.string   "name"
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "color"
  end

  create_table "cities", force: true do |t|
    t.string   "city"
    t.integer  "country_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "countries", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "messages", force: true do |t|
    t.string   "text"
    t.integer  "sender_id"
    t.integer  "receiver_id"
    t.integer  "ad_id"
    t.binary   "is_read"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "is_close",    default: 0
  end

  create_table "price_types", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "ratings", force: true do |t|
    t.integer  "rate"
    t.integer  "rated_id"
    t.integer  "rater_id"
    t.integer  "ad_id"
    t.text     "comment"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "testes", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "types", force: true do |t|
    t.string   "name"
    t.integer  "flag"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
    t.string   "username"
    t.datetime "birthday"
    t.string   "phone"
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.integer  "city_id"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
