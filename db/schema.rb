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

ActiveRecord::Schema.define(version: 20140327112710) do

  create_table "adultroles", force: true do |t|
    t.string   "name"
    t.text     "options"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "adultroles_parents", id: false, force: true do |t|
    t.integer "parent_id"
    t.integer "adultrole_id"
  end

  add_index "adultroles_parents", ["adultrole_id"], name: "index_adultroles_parents_on_adultrole_id"
  add_index "adultroles_parents", ["parent_id"], name: "index_adultroles_parents_on_parent_id"

  create_table "attendancetypes", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "burrows", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "committees", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "committees_parents", id: false, force: true do |t|
    t.integer "parent_id"
    t.integer "committee_id"
  end

  add_index "committees_parents", ["committee_id"], name: "index_committees_parents_on_committee_id"
  add_index "committees_parents", ["parent_id"], name: "index_committees_parents_on_parent_id"

  create_table "countries", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "districts", force: true do |t|
    t.string   "name"
    t.integer  "region_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "districts", ["region_id"], name: "index_districts_on_region_id"

  create_table "groups", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "parents", force: true do |t|
    t.string   "surname"
    t.string   "firstnames"
    t.string   "idnumber"
    t.text     "address"
    t.string   "postal_code"
    t.string   "tel_work"
    t.string   "email"
    t.string   "cell"
    t.string   "tel_home"
    t.boolean  "gender"
    t.string   "marital_status"
    t.string   "occupation"
    t.string   "employer"
    t.string   "searchstring"
    t.boolean  "member_of_scouts_sa", default: false
    t.text     "hobby"
    t.text     "family_code"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "parents_committees", id: false, force: true do |t|
    t.integer "parent_id"
    t.integer "committee_id"
  end

  add_index "parents_committees", ["committee_id"], name: "index_parents_committees_on_committee_id"
  add_index "parents_committees", ["parent_id"], name: "index_parents_committees_on_parent_id"

  create_table "parents_recruits", id: false, force: true do |t|
    t.integer "parent_id"
    t.integer "recruit_id"
  end

  add_index "parents_recruits", ["parent_id"], name: "index_parents_recruits_on_parent_id"
  add_index "parents_recruits", ["recruit_id"], name: "index_parents_recruits_on_recruit_id"

  create_table "patrols", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "recruitevents", force: true do |t|
    t.date     "related_date"
    t.integer  "recruit_id"
    t.integer  "attendancetype_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "recruitevents", ["attendancetype_id"], name: "index_recruitevents_on_attendancetype_id"
  add_index "recruitevents", ["recruit_id"], name: "index_recruitevents_on_recruit_id"

  create_table "recruits", force: true do |t|
    t.string   "region"
    t.string   "district"
    t.string   "group"
    t.boolean  "cub"
    t.boolean  "scout"
    t.boolean  "meerkat"
    t.datetime "form_date"
    t.string   "recruit_surname"
    t.string   "recruit_initials"
    t.string   "recruit_firstnames"
    t.string   "recruit_idnumber"
    t.datetime "recruit_dob"
    t.text     "recruit_address"
    t.string   "recruit_tel_home"
    t.string   "recruit_tel_cell"
    t.string   "recruit_email"
    t.integer  "recruit_gender"
    t.string   "recruit_religion"
    t.text     "recruit_special_conditions"
    t.string   "doctor_name"
    t.string   "doctor_tel"
    t.string   "medical_scheme"
    t.string   "medical_number"
    t.string   "medical_principle"
    t.string   "school"
    t.string   "searchstring"
    t.integer  "sixer_id"
    t.integer  "patrol_id"
    t.integer  "burrow_id"
    t.text     "hobby"
    t.boolean  "is_sixer"
    t.boolean  "is_second"
    t.boolean  "is_patrol_leader"
    t.boolean  "is_assistant_patrol_leader"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "recruits", ["burrow_id"], name: "index_recruits_on_burrow_id"
  add_index "recruits", ["patrol_id"], name: "index_recruits_on_patrol_id"
  add_index "recruits", ["sixer_id"], name: "index_recruits_on_sixer_id"

  create_table "regions", force: true do |t|
    t.string   "name"
    t.integer  "country_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "regions", ["country_id"], name: "index_regions_on_country_id"

  create_table "sixers", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "name"
    t.string   "email"
    t.string   "password"
    t.integer  "recruit_id"
    t.integer  "parent_id"
    t.boolean  "cub_access"
    t.boolean  "scout_access"
    t.boolean  "parent_access"
    t.boolean  "blog_access"
    t.boolean  "group_access"
    t.text     "options"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["parent_id"], name: "index_users_on_parent_id"
  add_index "users", ["recruit_id"], name: "index_users_on_recruit_id"

  create_table "versions", force: true do |t|
    t.integer  "versioned_id"
    t.string   "versioned_type"
    t.integer  "user_id"
    t.string   "user_type"
    t.string   "user_name"
    t.text     "modifications"
    t.integer  "number"
    t.integer  "reverted_from"
    t.string   "tag"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "versions", ["created_at"], name: "index_versions_on_created_at"
  add_index "versions", ["number"], name: "index_versions_on_number"
  add_index "versions", ["tag"], name: "index_versions_on_tag"
  add_index "versions", ["user_id", "user_type"], name: "index_versions_on_user_id_and_user_type"
  add_index "versions", ["user_name"], name: "index_versions_on_user_name"
  add_index "versions", ["versioned_id", "versioned_type"], name: "index_versions_on_versioned_id_and_versioned_type"

end
