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

ActiveRecord::Schema.define(:version => 20140918135816) do

  create_table "categories", :force => true do |t|
    t.integer  "category_id"
    t.string   "name"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "categories", ["category_id"], :name => "index_categories_on_category_id"
  add_index "categories", ["name"], :name => "index_categories_on_name"

  create_table "events", :force => true do |t|
    t.string   "name"
    t.string   "description"
    t.integer  "poi_id"
    t.datetime "from_date"
    t.datetime "to_date"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "groups", :force => true do |t|
    t.string   "name"
    t.string   "description"
    t.integer  "user_id"
    t.integer  "group_type"
    t.string   "password"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "groups_users", :force => true do |t|
    t.integer  "group_id"
    t.integer  "user_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "pois", :force => true do |t|
    t.string   "name"
    t.string   "description"
    t.decimal  "latitude",    :precision => 10, :scale => 6
    t.decimal  "longitude",   :precision => 10, :scale => 6
    t.string   "address"
    t.integer  "category_id"
    t.integer  "user_id"
    t.datetime "created_at",                                 :null => false
    t.datetime "updated_at",                                 :null => false
  end

  add_index "pois", ["latitude", "longitude"], :name => "index_pois_on_latitude_and_longitude"

  create_table "users", :force => true do |t|
    t.string   "facebook_id"
    t.string   "email"
    t.string   "name"
    t.string   "surname"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

end
