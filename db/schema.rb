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

ActiveRecord::Schema.define(:version => 20130811205933) do

  create_table "active_admin_comments", :force => true do |t|
    t.string   "resource_id",   :null => false
    t.string   "resource_type", :null => false
    t.integer  "author_id"
    t.string   "author_type"
    t.text     "body"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
    t.string   "namespace"
  end

  add_index "active_admin_comments", ["author_type", "author_id"], :name => "index_active_admin_comments_on_author_type_and_author_id"
  add_index "active_admin_comments", ["namespace"], :name => "index_active_admin_comments_on_namespace"
  add_index "active_admin_comments", ["resource_type", "resource_id"], :name => "index_admin_notes_on_resource_type_and_resource_id"

  create_table "admin_users", :force => true do |t|
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
    t.integer  "role_bits",              :default => 0,  :null => false
    t.string   "username"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
  end

  add_index "admin_users", ["email"], :name => "index_admin_users_on_email", :unique => true
  add_index "admin_users", ["reset_password_token"], :name => "index_admin_users_on_reset_password_token", :unique => true
  add_index "admin_users", ["username"], :name => "index_admin_users_on_username", :unique => true

  create_table "character_skills", :force => true do |t|
    t.integer "character_id"
    t.integer "skill_id"
    t.integer "rank"
    t.string  "specialization"
    t.integer "specialization_rank"
  end

  create_table "characters", :force => true do |t|
    t.integer  "admin_user_id"
    t.string   "name"
    t.string   "char_class",      :limit => 20
    t.text     "description"
    t.string   "race",            :limit => 10
    t.string   "constitution",    :limit => 10
    t.string   "speed",           :limit => 10
    t.string   "strength",        :limit => 10
    t.string   "charisma",        :limit => 10
    t.string   "intelligence",    :limit => 10
    t.string   "willpower",       :limit => 10
    t.decimal  "essence",                       :precision => 8, :scale => 2
    t.integer  "mana",            :limit => 2
    t.string   "reaction",        :limit => 10
    t.string   "initiative",      :limit => 20
    t.text     "gear"
    t.text     "cyberware"
    t.text     "weapons"
    t.text     "skills"
    t.text     "connections"
    t.text     "other_stuff"
    t.text     "armor_items"
    t.integer  "ballistic_armor", :limit => 2
    t.integer  "burst_armor",     :limit => 2
    t.string   "visibility"
    t.integer  "age",             :limit => 2
    t.string   "sex",             :limit => 10
    t.datetime "created_at",                                                  :null => false
    t.datetime "updated_at",                                                  :null => false
  end

  add_index "characters", ["char_class"], :name => "index_characters_on_char_class"
  add_index "characters", ["race"], :name => "index_characters_on_race"
  add_index "characters", ["visibility"], :name => "index_characters_on_visibility"

  create_table "characters_spells", :force => true do |t|
    t.integer "character_id"
    t.integer "spell_id"
  end

  create_table "characters_weapons", :force => true do |t|
    t.integer "character_id"
    t.integer "weapon_id"
  end

  create_table "shadowrules", :force => true do |t|
    t.string   "title",       :null => false
    t.string   "excerpt"
    t.text     "description"
    t.integer  "added_by"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "shadowrules", ["title"], :name => "index_shadowrules_on_title"

  create_table "skills", :force => true do |t|
    t.string "name"
    t.text   "description"
    t.string "reference_attribute"
  end

  create_table "spells", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.string   "kind"
    t.string   "range"
    t.string   "category"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "weapons", :force => true do |t|
    t.string  "name"
    t.string  "range"
    t.string  "damagecode"
    t.integer "camouflage"
    t.string  "reach"
    t.string  "modes"
    t.string  "ammunition"
  end

end
