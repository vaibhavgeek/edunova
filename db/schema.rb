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

ActiveRecord::Schema.define(version: 20160114124702) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "comments", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "comment"
    t.integer  "note_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "feeds", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "object_id"
    t.string   "set_type"
    t.string   "fcontent"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "comment_id"
  end

  create_table "friendly_id_slugs", force: :cascade do |t|
    t.string   "slug",                      null: false
    t.integer  "sluggable_id",              null: false
    t.string   "sluggable_type", limit: 50
    t.string   "scope"
    t.datetime "created_at"
  end

  add_index "friendly_id_slugs", ["slug", "sluggable_type", "scope"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope", unique: true, using: :btree
  add_index "friendly_id_slugs", ["slug", "sluggable_type"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type", using: :btree
  add_index "friendly_id_slugs", ["sluggable_id"], name: "index_friendly_id_slugs_on_sluggable_id", using: :btree
  add_index "friendly_id_slugs", ["sluggable_type"], name: "index_friendly_id_slugs_on_sluggable_type", using: :btree

  create_table "intrests", force: :cascade do |t|
    t.string   "value"
    t.integer  "user_id"
    t.integer  "edunova_cert"
    t.string   "media"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.integer  "trend_count"
    t.string   "about"
  end

  create_table "lists", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "completed"
    t.string   "started"
    t.integer  "note_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "notes", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.text     "note_from_author"
    t.integer  "comments_id"
    t.integer  "spam_count"
    t.string   "prereq"
    t.string   "file"
    t.integer  "list_count_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.integer  "user_id"
    t.integer  "total_levels"
    t.integer  "publish"
    t.string   "slug"
  end

  add_index "notes", ["slug"], name: "index_notes_on_slug", using: :btree

  create_table "notifications", force: :cascade do |t|
    t.integer  "read"
    t.integer  "from_id"
    t.integer  "to_id"
    t.integer  "person3_id"
    t.string   "category"
    t.string   "content"
    t.integer  "object_id"
    t.integer  "note_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "passions", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "video_url"
    t.string   "label"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "plays", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "note_id"
    t.integer  "p_count"
    t.integer  "current_level"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "questions", force: :cascade do |t|
    t.string   "question_text"
    t.string   "description"
    t.integer  "note_id"
    t.integer  "user_id"
    t.integer  "level"
    t.integer  "order"
    t.integer  "answer"
    t.string   "solution"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.string   "option1"
    t.string   "option2"
    t.string   "option3"
    t.string   "option4"
  end

  create_table "relationships", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "follower_id"
    t.integer  "following_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "provider"
    t.string   "uid"
    t.string   "image_id"
    t.string   "name"
    t.string   "gender"
    t.string   "intrested_in"
    t.string   "description"
    t.date     "dob"
    t.string   "username"
    t.string   "slug"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.integer  "awesome"
  end

  add_index "users", ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true, using: :btree
  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  add_index "users", ["slug"], name: "index_users_on_slug", using: :btree

  create_table "votes", force: :cascade do |t|
    t.integer  "votable_id"
    t.string   "votable_type"
    t.integer  "voter_id"
    t.string   "voter_type"
    t.boolean  "vote_flag"
    t.string   "vote_scope"
    t.integer  "vote_weight"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "votes", ["votable_id", "votable_type", "vote_scope"], name: "index_votes_on_votable_id_and_votable_type_and_vote_scope", using: :btree
  add_index "votes", ["voter_id", "voter_type", "vote_scope"], name: "index_votes_on_voter_id_and_voter_type_and_vote_scope", using: :btree

end
