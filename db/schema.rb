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

ActiveRecord::Schema.define(version: 2019_09_30_075146) do

  create_table "count_users", force: :cascade do |t|
    t.integer "user_id"
    t.integer "count_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["count_id"], name: "index_count_users_on_count_id"
    t.index ["user_id"], name: "index_count_users_on_user_id"
  end

  create_table "counts", force: :cascade do |t|
    t.string "title"
    t.integer "number"
    t.integer "user_id"
    t.string "img"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["user_id"], name: "index_counts_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "img"
  end

end
