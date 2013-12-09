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

ActiveRecord::Schema.define(version: 20131209093600) do

  create_table "academy_answers", force: true do |t|
    t.integer  "question_id",                 null: false
    t.integer  "user_id",                     null: false
    t.integer  "up",          default: 0
    t.integer  "down",        default: 0
    t.boolean  "is_deleted",  default: false
    t.string   "image_url"
    t.text     "text"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "academy_questions", force: true do |t|
    t.integer  "user_id",                     null: false
    t.integer  "category_id",                 null: false
    t.string   "title",                       null: false
    t.text     "text"
    t.boolean  "is_deleted",  default: false
    t.string   "image_url"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "academy_tutorial_images", force: true do |t|
    t.integer  "tutorial_id",                 null: false
    t.string   "url"
    t.boolean  "is_deleted",  default: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "academy_tutorials", force: true do |t|
    t.integer  "category_id",                       null: false
    t.integer  "user_id",                           null: false
    t.boolean  "aproved",           default: false
    t.string   "title"
    t.text     "text"
    t.boolean  "is_deleted",        default: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "rapid_description"
  end

  create_table "academy_votes", force: true do |t|
    t.integer  "vote"
    t.integer  "user_id",    null: false
    t.integer  "answer_id",  null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "academy_workshop_registrations", force: true do |t|
    t.integer  "workshop_id",                 null: false
    t.integer  "user_id",                     null: false
    t.boolean  "is_deleted",  default: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "academy_workshops", force: true do |t|
    t.integer  "user_id",                               null: false
    t.integer  "available_slots"
    t.integer  "slots_taken"
    t.float    "price"
    t.string   "local"
    t.datetime "date"
    t.string   "description"
    t.boolean  "is_deleted",            default: false
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
    t.integer  "type_price_id",                  null: false
    t.integer  "city_id",                        null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id",                        null: false
    t.string   "permanent_link"
    t.integer  "category_id",                    null: false
    t.integer  "page_views",     default: 0
    t.boolean  "is_deleted",     default: false
    t.boolean  "is_active",      default: false
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

  create_table "questions", force: true do |t|
    t.integer  "user_id"
    t.integer  "category_id"
    t.string   "title"
    t.string   "text"
    t.integer  "is_deleted"
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

  create_table "talks", force: true do |t|
    t.integer  "user_one",               null: false
    t.integer  "user_two",               null: false
    t.integer  "ad_id"
    t.integer  "is_close",   default: 0
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

  create_table "user_follows", force: true do |t|
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "following_id"
  end

  add_index "user_follows", ["following_id"], name: "index_user_follows_on_following_id", using: :btree
  add_index "user_follows", ["user_id"], name: "index_user_follows_on_user_id", using: :btree

  create_table "votes", force: true do |t|
    t.integer  "vote"
    t.integer  "user_id"
    t.integer  "answer_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
