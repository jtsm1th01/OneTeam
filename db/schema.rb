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

ActiveRecord::Schema.define(version: 20161014194233) do

  create_table "assignments", force: true do |t|
    t.integer  "employee_id"
    t.integer  "project_request_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "current_skills", force: true do |t|
    t.integer  "employee_id"
    t.integer  "skill_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "skill_level"
  end

  create_table "departments", force: true do |t|
    t.string   "department_name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "desired_skills", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "skill_id"
    t.integer  "employee_id"
  end

  create_table "employees", force: true do |t|
    t.string   "employee_name"
    t.string   "employee_email"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "years_with_company"
    t.integer  "manager_id"
    t.integer  "title_id"
    t.integer  "department_id"
    t.integer  "location_id"
    t.string   "password_digest"
    t.string   "remember_digest"
    t.boolean  "admin"
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
    t.integer  "employee_id"
    t.date     "start_date"
    t.date     "end_date"
    t.boolean  "filled",      default: false
  end

  create_table "projects", force: true do |t|
    t.string   "project_name"
    t.date     "project_start"
    t.date     "project_end"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "employee_id"
  end

  create_table "required_skills", force: true do |t|
    t.integer "project_request_id"
    t.integer "skill_id"
  end

  create_table "responses", force: true do |t|
    t.integer  "employee_id"
    t.integer  "project_request_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "note"
    t.text     "comment"
  end

  create_table "reviews", force: true do |t|
    t.integer  "assignment_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "skill_reviews", force: true do |t|
    t.integer  "review_id"
    t.integer  "skill_id"
    t.integer  "experience"
    t.integer  "skill_level"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "skills", force: true do |t|
    t.string   "skill_name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "titles", force: true do |t|
    t.string   "title_name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
