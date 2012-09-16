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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20120916015503) do

  create_table "aca_data", :force => true do |t|
    t.integer  "aca_number"
    t.integer  "usac_number"
    t.boolean  "has_transponder"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  create_table "categories", :force => true do |t|
    t.string   "cat_name"
    t.integer  "cat_number"
    t.integer  "cat_lower_age"
    t.integer  "cat_upper_age"
    t.boolean  "cat_age_based"
    t.boolean  "cat_upper_age_control"
    t.datetime "created_at",            :null => false
    t.datetime "updated_at",            :null => false
  end

  create_table "entries", :force => true do |t|
    t.integer  "race_id"
    t.integer  "rider_registration_id"
    t.datetime "created_at",            :null => false
    t.datetime "updated_at",            :null => false
  end

  create_table "race_events", :force => true do |t|
    t.string   "name"
    t.date     "date"
    t.integer  "race_type_id"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  create_table "race_types", :force => true do |t|
    t.string   "race_type"
    t.datetime "created_at",             :null => false
    t.datetime "updated_at",             :null => false
    t.string   "race_type_abbreviation"
    t.string   "race_type_column"
  end

  create_table "races", :force => true do |t|
    t.boolean  "women"
    t.integer  "min_age"
    t.integer  "max_age"
    t.decimal  "entry_fee"
    t.integer  "min_category"
    t.integer  "max_category"
    t.boolean  "all_categories"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
    t.integer  "race_event_id"
    t.string   "name"
    t.boolean  "masters"
    t.boolean  "youth"
    t.boolean  "u23"
    t.boolean  "seniors"
    t.boolean  "juniors"
  end

  create_table "rails_admin_histories", :force => true do |t|
    t.text     "message"
    t.string   "username"
    t.integer  "item"
    t.string   "table"
    t.integer  "month",      :limit => 2
    t.integer  "year",       :limit => 5
    t.datetime "created_at",              :null => false
    t.datetime "updated_at",              :null => false
  end

  add_index "rails_admin_histories", ["item", "table", "month", "year"], :name => "index_rails_admin_histories"

  create_table "rider_registrations", :force => true do |t|
    t.integer  "rider_id"
    t.integer  "entry_id"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
    t.boolean  "signed_release"
  end

  create_table "riders", :force => true do |t|
    t.boolean  "suspended"
    t.integer  "license_number"
    t.string   "last_name"
    t.string   "first_name"
    t.string   "city"
    t.string   "state"
    t.boolean  "female"
    t.integer  "racing_age"
    t.date     "exp_date"
    t.string   "rd_club"
    t.string   "rd_team"
    t.string   "track_club"
    t.string   "track_team"
    t.string   "cx_club"
    t.string   "cx_team"
    t.string   "intl_team"
    t.string   "ncca_club"
    t.integer  "road_cat"
    t.integer  "track_cat"
    t.integer  "cross_cat"
    t.date     "birthdate"
    t.boolean  "citizen"
    t.string   "emergency_contact"
    t.string   "e_contact_phone"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
    t.boolean  "one_day"
    t.integer  "category"
  end

  create_table "users", :force => true do |t|
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
