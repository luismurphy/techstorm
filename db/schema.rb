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

ActiveRecord::Schema.define(version: 20141104002028) do

  create_table "collaborates", primary_key: "uid", force: true do |t|
    t.integer "pid"
  end

  add_index "collaborates", ["uid", "pid"], name: "sqlite_autoindex_collaborates_1", unique: true

  create_table "comments_on", primary_key: "uid", force: true do |t|
    t.integer   "pid"
    t.timestamp "date"
    t.text      "comment"
  end

  add_index "comments_on", ["uid", "pid"], name: "sqlite_autoindex_comments_on_1", unique: true

  create_table "follows", primary_key: "uid", force: true do |t|
    t.integer "pid"
  end

  add_index "follows", ["uid", "pid"], name: "sqlite_autoindex_follows_1", unique: true

  create_table "has_skills", primary_key: "uid", force: true do |t|
    t.string "skill", limit: 30
  end

  add_index "has_skills", ["uid", "skill"], name: "sqlite_autoindex_has_skills_1", unique: true

  create_table "has_tags", primary_key: "pid", force: true do |t|
    t.string "tag", limit: 30
  end

  add_index "has_tags", ["pid", "tag"], name: "sqlite_autoindex_has_tags_1", unique: true

  create_table "has_tasks", primary_key: "user1", force: true do |t|
    t.integer "user2"
    t.boolean "pending"
  end

  add_index "has_tasks", ["user1", "user2"], name: "sqlite_autoindex_has_tasks_1", unique: true

  create_table "messages", force: true do |t|
    t.string    "title",     limit: 40
    t.text      "content"
    t.timestamp "send_time"
    t.timestamp "seen_time"
  end

  add_index "messages", ["id"], name: "sqlite_autoindex_messages_1", unique: true

  create_table "projects", force: true do |t|
    t.integer   "creator"
    t.timestamp "created_at"
    t.string    "name",        limit: 20
    t.text      "description"
  end

  add_index "projects", ["id"], name: "sqlite_autoindex_projects_1", unique: true

  create_table "requires_skills", primary_key: "pid", force: true do |t|
    t.string "skill", limit: 30
  end

  add_index "requires_skills", ["pid", "skill"], name: "sqlite_autoindex_requires_skills_1", unique: true

  create_table "sends", primary_key: "sender", force: true do |t|
    t.integer "receiver"
    t.integer "mid"
  end

  add_index "sends", ["sender", "receiver", "mid"], name: "sqlite_autoindex_sends_1", unique: true

  create_table "skills", primary_key: "skill_name", force: true do |t|
  end

  add_index "skills", ["skill_name"], name: "sqlite_autoindex_skills_1", unique: true

  create_table "tags", primary_key: "tag_name", force: true do |t|
  end

  add_index "tags", ["tag_name"], name: "sqlite_autoindex_tags_1", unique: true

# Could not dump table "tasks" because of following NoMethodError
#   undefined method `[]' for nil:NilClass

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
    t.text    "interest"
    t.text    "location"
    t.text    "facebook"
    t.text    "twitter"
    t.text    "linkedin"
    t.text    "github"
  end

  add_index "users", ["email"], name: "sqlite_autoindex_users_2", unique: true
  add_index "users", ["id"], name: "sqlite_autoindex_users_1", unique: true

  create_table "works_on", primary_key: "uid", force: true do |t|
    t.integer "tid"
    t.integer "pid"
  end

  add_index "works_on", ["uid", "tid", "pid"], name: "sqlite_autoindex_works_on_1", unique: true

end
