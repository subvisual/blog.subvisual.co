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

ActiveRecord::Schema.define(:version => 20130126180943) do

  create_table "boss_banners", :force => true do |t|
    t.integer "boss_resource_id"
    t.date    "finish_date"
    t.string  "link"
    t.date    "start_date"
    t.string  "title"
  end

  create_table "boss_categories", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "boss_posts", :force => true do |t|
    t.string   "title",                            :null => false
    t.text     "body",                             :null => false
    t.datetime "published_date"
    t.boolean  "draft",          :default => true
    t.datetime "created_at",                       :null => false
    t.datetime "updated_at",                       :null => false
    t.integer  "category_id",    :default => 1
  end

  add_index "boss_posts", ["category_id"], :name => "index_boss_posts_on_category_id"

  create_table "boss_resources", :force => true do |t|
    t.string   "resource_file_name"
    t.string   "resource_content_type"
    t.integer  "resource_file_size"
    t.datetime "created_at",            :null => false
    t.datetime "updated_at",            :null => false
    t.string   "extension"
  end

  add_index "boss_resources", ["extension"], :name => "index_boss_resources_on_extension"

  create_table "citygate_authorizations", :force => true do |t|
    t.string   "provider"
    t.string   "uid"
    t.integer  "user_id"
    t.string   "token"
    t.string   "secret"
    t.string   "name"
    t.string   "link"
    t.string   "image_url"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "citygate_roles", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "citygate_users", :force => true do |t|
    t.string   "email",                                :default => "", :null => false
    t.string   "encrypted_password",                   :default => ""
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                        :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                                           :null => false
    t.datetime "updated_at",                                           :null => false
    t.string   "first_name"
    t.string   "last_name"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.string   "invitation_token",       :limit => 60
    t.datetime "invitation_sent_at"
    t.datetime "invitation_accepted_at"
    t.integer  "invitation_limit"
    t.integer  "invited_by_id"
    t.string   "invited_by_type"
    t.string   "password_salt"
    t.integer  "role_id"
    t.string   "username"
  end

  add_index "citygate_users", ["confirmation_token"], :name => "index_citygate_users_on_confirmation_token", :unique => true
  add_index "citygate_users", ["email"], :name => "index_citygate_users_on_email", :unique => true
  add_index "citygate_users", ["invitation_token"], :name => "index_citygate_users_on_invitation_token"
  add_index "citygate_users", ["invited_by_id"], :name => "index_citygate_users_on_invited_by_id"
  add_index "citygate_users", ["reset_password_token"], :name => "index_citygate_users_on_reset_password_token", :unique => true
  add_index "citygate_users", ["username"], :name => "index_citygate_users_on_username", :unique => true

  create_table "taggings", :force => true do |t|
    t.integer  "tag_id"
    t.integer  "taggable_id"
    t.string   "taggable_type"
    t.integer  "tagger_id"
    t.string   "tagger_type"
    t.string   "context",       :limit => 128
    t.datetime "created_at"
  end

  add_index "taggings", ["tag_id"], :name => "index_taggings_on_tag_id"
  add_index "taggings", ["taggable_id", "taggable_type", "context"], :name => "index_taggings_on_taggable_id_and_taggable_type_and_context"

  create_table "tags", :force => true do |t|
    t.string "name"
  end

end
