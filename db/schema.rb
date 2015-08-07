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

ActiveRecord::Schema.define(version: 20150807142123) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "collaborations", force: :cascade do |t|
    t.integer  "collaborator_id",                     null: false
    t.integer  "project_id",                          null: false
    t.string   "status",          default: "pending", null: false
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "collaborations", ["collaborator_id"], name: "index_collaborations_on_collaborator_id", using: :btree
  add_index "collaborations", ["project_id"], name: "index_collaborations_on_project_id", using: :btree

  create_table "project_tags", force: :cascade do |t|
    t.integer  "project_id", null: false
    t.integer  "tag_id",     null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "project_tags", ["project_id"], name: "index_project_tags_on_project_id", using: :btree
  add_index "project_tags", ["tag_id"], name: "index_project_tags_on_tag_id", using: :btree

  create_table "projects", force: :cascade do |t|
    t.integer  "creator_id",     null: false
    t.string   "title",          null: false
    t.text     "description",    null: false
    t.date     "start_date"
    t.date     "end_date"
    t.string   "status",         null: false
    t.text     "skills_desired", null: false
    t.string   "repo_link"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_index "projects", ["creator_id"], name: "index_projects_on_creator_id", using: :btree

  create_table "tags", force: :cascade do |t|
    t.string   "name",       null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "username",        null: false
    t.string   "first_name",      null: false
    t.string   "last_name",       null: false
    t.string   "email",           null: false
    t.string   "password_digest", null: false
    t.text     "bio"
    t.string   "zip_code",        null: false
    t.float    "longitude",       null: false
    t.float    "latitude",        null: false
    t.string   "github_link"
    t.string   "website_link"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_index "users", ["username"], name: "index_users_on_username", using: :btree

end
