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

ActiveRecord::Schema.define(version: 20140129035204) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "keys", force: true do |t|
    t.string   "label"
    t.integer  "slots"
    t.date     "expiration_date"
    t.date     "disabled_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "review_tags", force: true do |t|
    t.string   "name"
    t.integer  "value"
    t.integer  "review_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "review_tags", ["review_id"], name: "index_review_tags_on_review_id", using: :btree

  create_table "reviews", force: true do |t|
    t.string   "name"
    t.boolean  "is_playing"
    t.float    "rating"
    t.string   "image_url"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "profile_url"
  end

  create_table "user_reviews", force: true do |t|
    t.integer  "review_id"
    t.integer  "user_id"
    t.boolean  "liked"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "user_reviews", ["review_id"], name: "index_user_reviews_on_review_id", using: :btree
  add_index "user_reviews", ["user_id"], name: "index_user_reviews_on_user_id", using: :btree

  create_table "users", force: true do |t|
    t.string   "name"
    t.string   "login"
    t.string   "password"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "key_id"
  end

  add_index "users", ["key_id"], name: "index_users_on_key_id", using: :btree

end
