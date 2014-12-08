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

ActiveRecord::Schema.define(version: 20141208232020) do

  create_table "departments", force: true do |t|
    t.string   "department_name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "employees", force: true do |t|
    t.string   "employee_name"
    t.string   "employee_email"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "years_with_company"
    t.integer  "employee_id"
    t.integer  "title_id"
    t.integer  "group_id"
    t.integer  "location_id"
  end

  create_table "groups", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "group_name"
    t.integer  "department_id"
  end

  create_table "locations", force: true do |t|
    t.string   "location_name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "project_requests", force: true do |t|
    t.integer  "project_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "description"
  end

  create_table "project_requests_skills", id: false, force: true do |t|
    t.integer "project_request_id", null: false
    t.integer "skill_id",           null: false
  end

  create_table "projects", force: true do |t|
    t.string   "project_name"
    t.date     "project_start"
    t.date     "project_end"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "employee_id"
  end

  create_table "skills", force: true do |t|
    t.string   "skill_name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "skills_employees", id: false, force: true do |t|
    t.integer "employee_id", null: false
    t.integer "skill_id",    null: false
  end

  create_table "titles", force: true do |t|
    t.string   "title_name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
