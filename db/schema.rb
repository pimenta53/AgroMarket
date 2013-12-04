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

ActiveRecord::Schema.define(version: 20131204135335) do

  create_table "academy_answers", force: true do |t|
    t.integer  "question_id",             null: false
    t.integer  "user_id",                 null: false
    t.integer  "up",          default: 0
    t.integer  "down",        default: 0
    t.integer  "is_deleted",  default: 0
    t.string   "image_url"
    t.string   "text"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "academy_questions", force: true do |t|
    t.integer  "user_id",                 null: false
    t.integer  "category_id",             null: false
    t.string   "title"
    t.string   "text"
    t.integer  "is_deleted",  default: 0
    t.string   "image_url"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "academy_tutorial_images", force: true do |t|
    t.integer  "tutorial_id",             null: false
    t.string   "url"
    t.integer  "is_deleted",  default: 0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "academy_tutorials", force: true do |t|
    t.integer  "category_id",             null: false
    t.integer  "user_id",                 null: false
    t.integer  "aproved",     default: 0
    t.string   "title"
    t.text     "text"
    t.integer  "is_delected", default: 0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "academy_votes", force: true do |t|
    t.integer  "vote"
    t.integer  "user_id",    null: false
    t.integer  "answer_id",  null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "academy_workshop_registrations", force: true do |t|
    t.integer  "workshop_id",             null: false
    t.integer  "user_id",                 null: false
    t.integer  "is_deleted",  default: 0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "academy_workshops", force: true do |t|
    t.integer  "user_id",                           null: false
    t.integer  "available_slots"
    t.integer  "slots_taken",           default: 0
    t.float    "price"
    t.string   "local"
    t.datetime "date"
    t.string   "description"
    t.integer  "is_delected",           default: 0
    t.integer  "requires_registration"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "ad_images", force: true do |t|
    t.integer  "ad_id",              null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
  end

  create_table "ads", force: true do |t|
    t.string   "title"
    t.string   "description"
    t.float    "price"
    t.datetime "expire_date"
    t.string   "location"
    t.integer  "type_price_id",              null: false
    t.integer  "city_id",                    null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id",                    null: false
    t.string   "permanent_link"
    t.integer  "category_id",                null: false
    t.integer  "page_views",     default: 0
    t.boolean  "is_deleted"
    t.boolean  "is_active"
  end

  create_table "authentications", force: true do |t|
    t.integer  "user_id"
    t.string   "provider"
    t.string   "uid"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "authentications", ["user_id"], name: "index_authentications_on_user_id", using: :btree

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
    t.integer  "talk_id",     null: false
    t.integer  "user_sender", null: false
    t.string   "text"
    t.integer  "is_read"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "price_types", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "ratings", force: true do |t|
    t.integer  "rate"
    t.integer  "rated_id",   null: false
    t.integer  "rater_id",   null: false
    t.integer  "ad_id",      null: false
    t.text     "comment"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "talks", force: true do |t|
    t.integer  "user_one",               null: false
    t.integer  "user_two",               null: false
    t.integer  "ad_id",                  null: false
    t.integer  "is_close",   default: 0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "types", force: true do |t|
    t.string   "name"
    t.integer  "flag"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "user_follows", force: true do |t|
    t.integer  "user_id",      null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "following_id", null: false
  end

  add_index "user_follows", ["following_id"], name: "index_user_follows_on_following_id", using: :btree
  add_index "user_follows", ["user_id"], name: "index_user_follows_on_user_id", using: :btree

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
