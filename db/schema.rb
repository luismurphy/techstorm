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

ActiveRecord::Schema.define(version: 20141103011237) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "collaborates", primary_key: "uid", force: true do |t|
    t.integer "pid", null: false
  end

  create_table "comments_on", primary_key: "uid", force: true do |t|
    t.integer  "pid",     null: false
    t.datetime "date"
    t.text     "comment"
  end

  create_table "follows", primary_key: "uid", force: true do |t|
    t.integer "pid", null: false
  end

  create_table "has_skills", primary_key: "uid", force: true do |t|
    t.string "skill", limit: 30, null: false
  end

  create_table "has_tags", primary_key: "pid", force: true do |t|
    t.string "tag", limit: 30, null: false
  end

  create_table "has_tasks", primary_key: "user1", force: true do |t|
    t.integer "user2",   null: false
    t.boolean "pending"
  end

  create_table "messages", force: true do |t|
    t.string   "title",     limit: 40
    t.text     "content"
    t.datetime "send_time"
    t.datetime "seen_time"
  end

  create_table "projects", force: true do |t|
    t.integer  "creator"
    t.datetime "created_at"
    t.string   "name",        limit: 20
    t.text     "description"
  end

  create_table "requires_skills", primary_key: "pid", force: true do |t|
    t.string "skill", limit: 30, null: false
  end

  create_table "sends", primary_key: "sender", force: true do |t|
    t.integer "receiver", null: false
    t.integer "mid",      null: false
  end

  create_table "skills", primary_key: "skill_name", force: true do |t|
  end

  create_table "tags", primary_key: "tag_name", force: true do |t|
  end

  create_table "tasks", primary_key: "tid", force: true do |t|
    t.integer "pid",                    null: false
    t.string  "task_name",   limit: 30
    t.text    "description"
    t.integer "completed"
  end

  create_table "users", force: true do |t|
    t.string  "email",           limit: 40
    t.string  "password_digest"
    t.text    "user_photo_link"
    t.string  "field_of_work",   limit: 40
    t.integer "ranking"
    t.boolean "private"
    t.text    "user_info"
    t.string  "first_name",      limit: 30
    t.string  "last_name",       limit: 30
  end

  add_index "users", ["email"], name: "users_email_key", unique: true, using: :btree

  create_table "works_on", primary_key: "uid", force: true do |t|
    t.integer "tid", null: false
    t.integer "pid", null: false
  end

end
