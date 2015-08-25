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

ActiveRecord::Schema.define(version: 20150825202604) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "actors", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "comments", force: :cascade do |t|
    t.string   "body"
    t.integer  "commenter_id",     null: false
    t.integer  "commentable_id",   null: false
    t.string   "commentable_type", null: false
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  add_index "comments", ["commentable_type", "commentable_id"], name: "index_comments_on_commentable_type_and_commentable_id", using: :btree

  create_table "movies", force: :cascade do |t|
    t.integer  "admin_id",    null: false
    t.string   "title",       null: false
    t.string   "tagline"
    t.string   "image_url"
    t.string   "director"
    t.string   "producer"
    t.string   "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "reviews", force: :cascade do |t|
    t.integer  "stars"
    t.string   "title"
    t.text     "body"
    t.boolean  "thumb_is_up"
    t.integer  "reviewer_id"
    t.integer  "movie_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "roles", force: :cascade do |t|
    t.integer  "actor_id"
    t.integer  "movie_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "roles", ["actor_id"], name: "index_roles_on_actor_id", using: :btree
  add_index "roles", ["movie_id"], name: "index_roles_on_movie_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "username"
    t.string   "password_digest"
    t.boolean  "is_admin"
    t.boolean  "has_pro_permissions"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
  end

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

  add_foreign_key "roles", "actors"
  add_foreign_key "roles", "movies"
end
