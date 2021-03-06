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

ActiveRecord::Schema.define(:version => 20120326003633) do

  create_table "coalitions", :id => false, :force => true do |t|
    t.string  "code",                                        :null => false
    t.string  "name",                                        :null => false
    t.string  "name_in_malay",                               :null => false
    t.integer "founded_in",                                  :null => false
    t.integer "disbanded_in"
    t.string  "uuid",          :limit => 36, :default => "", :null => false
  end

  add_index "coalitions", ["code"], :name => "index_coalitions_on_code", :unique => true
  add_index "coalitions", ["uuid"], :name => "index_coalitions_on_uuid", :unique => true

  create_table "coalitionships", :id => false, :force => true do |t|
    t.string   "uuid",                           :null => false
    t.integer  "joined_at",                      :null => false
    t.integer  "parted_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "party_uuid",     :default => "", :null => false
    t.string   "coalition_uuid"
  end

  add_index "coalitionships", ["coalition_uuid", "party_uuid", "joined_at"], :name => "index_coalitionships_on_when_member_joins_party", :unique => true
  add_index "coalitionships", ["uuid"], :name => "index_coalitionships_on_uuid", :unique => true

  create_table "constituencies", :id => false, :force => true do |t|
    t.string   "uuid",          :limit => 36, :null => false
    t.string   "region_code",                 :null => false
    t.string   "member_uuid",                 :null => false
    t.string   "name",                        :null => false
    t.integer  "iteration",                   :null => false
    t.integer  "code",                        :null => false
    t.date     "valid_until"
    t.string   "previous_uuid"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "constituencies", ["member_uuid"], :name => "index_constituencies_on_member_uuid"
  add_index "constituencies", ["previous_uuid"], :name => "index_constituencies_on_previous_uuid"
  add_index "constituencies", ["region_code"], :name => "index_constituencies_on_region_code"
  add_index "constituencies", ["uuid"], :name => "index_constituencies_on_uuid", :unique => true

  create_table "districts", :id => false, :force => true do |t|
    t.string   "uuid",              :limit => 36, :null => false
    t.string   "constituency_uuid",               :null => false
    t.string   "member_uuid",                     :null => false
    t.string   "name",                            :null => false
    t.integer  "iteration",                       :null => false
    t.date     "valid_until"
    t.string   "previous_uuid"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "districts", ["constituency_uuid"], :name => "index_districts_on_constituency_uuid"
  add_index "districts", ["member_uuid"], :name => "index_districts_on_member_uuid"
  add_index "districts", ["previous_uuid"], :name => "index_districts_on_previous_uuid"
  add_index "districts", ["uuid"], :name => "index_districts_on_uuid", :unique => true

  create_table "members", :id => false, :force => true do |t|
    t.string   "uuid",        :limit => 36, :null => false
    t.string   "name",                      :null => false
    t.string   "email"
    t.string   "facebook"
    t.string   "twitter"
    t.string   "www"
    t.string   "phone"
    t.string   "fax"
    t.text     "biography"
    t.date     "birthday"
    t.date     "deceased_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "members", ["uuid"], :name => "index_members_on_uuid", :unique => true

  create_table "parties", :id => false, :force => true do |t|
    t.string  "code",                                        :null => false
    t.string  "name",                                        :null => false
    t.string  "name_in_malay",                               :null => false
    t.integer "founded_in",                                  :null => false
    t.integer "disbanded_in"
    t.string  "uuid",          :limit => 36, :default => "", :null => false
  end

  add_index "parties", ["code"], :name => "index_parties_on_code", :unique => true
  add_index "parties", ["uuid"], :name => "index_parties_on_uuid", :unique => true

  create_table "party_memberships", :id => false, :force => true do |t|
    t.string   "uuid",        :limit => 36, :null => false
    t.string   "member_uuid",               :null => false
    t.integer  "joined_at",                 :null => false
    t.integer  "parted_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "party_uuid"
  end

  add_index "party_memberships", ["party_uuid", "member_uuid", "joined_at"], :name => "index_party_memberships_on_when_member_joins_party", :unique => true
  add_index "party_memberships", ["uuid"], :name => "index_party_memberships_on_uuid", :unique => true

  create_table "regions", :id => false, :force => true do |t|
    t.string "code", :null => false
    t.string "name", :null => false
  end

  add_index "regions", ["code"], :name => "index_regions_on_code", :unique => true

  create_table "users", :id => false, :force => true do |t|
    t.string   "uuid",                 :limit => 36,                       :null => false
    t.string   "email",                               :default => "",      :null => false
    t.string   "encrypted_password",   :limit => 128, :default => "",      :null => false
    t.integer  "failed_attempts",                     :default => 0
    t.string   "unlock_token"
    t.datetime "locked_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                       :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "role",                 :limit => 16,  :default => "basic", :null => false
    t.string   "authentication_token"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["unlock_token"], :name => "index_users_on_unlock_token", :unique => true
  add_index "users", ["uuid"], :name => "index_users_on_uuid", :unique => true

end
