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

ActiveRecord::Schema.define(:version => 20100812075848) do

  create_table "categories", :force => true do |t|
    t.string   "name",        :null => false
    t.string   "description"
    t.integer  "parent_id"
    t.integer  "lft"
    t.integer  "rgt"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "categories", ["lft"], :name => "index_categories_on_lft"
  add_index "categories", ["name"], :name => "index_categories_on_name"
  add_index "categories", ["parent_id"], :name => "index_categories_on_parent_id"
  add_index "categories", ["rgt"], :name => "index_categories_on_rgt"

  create_table "comments", :force => true do |t|
    t.text     "body",             :null => false
    t.string   "name"
    t.string   "title"
    t.integer  "parent_id"
    t.integer  "lft"
    t.integer  "rgt"
    t.integer  "commentable_id"
    t.string   "commentable_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "comments", ["commentable_id"], :name => "index_comments_on_commentable_id"
  add_index "comments", ["commentable_type"], :name => "index_comments_on_commentable_type"
  add_index "comments", ["lft"], :name => "index_comments_on_lft"
  add_index "comments", ["parent_id"], :name => "index_comments_on_parent_id"
  add_index "comments", ["rgt"], :name => "index_comments_on_rgt"

  create_table "posts", :force => true do |t|
    t.string   "title",         :null => false
    t.string   "subtitle"
    t.text     "body",          :null => false
    t.integer  "postable_id"
    t.string   "postable_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "posts", ["postable_id"], :name => "index_posts_on_postable_id"
  add_index "posts", ["postable_type"], :name => "index_posts_on_postable_type"
  add_index "posts", ["title"], :name => "index_posts_on_title"

  create_table "resources", :force => true do |t|
    t.string   "title"
    t.text     "description"
    t.string   "url",          :null => false
    t.string   "content_type"
    t.text     "notes"
    t.string   "author"
    t.string   "language"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "resources", ["url"], :name => "index_resources_on_url"

  create_table "taggings", :force => true do |t|
    t.integer  "tag_id"
    t.integer  "taggable_id"
    t.string   "taggable_type"
    t.integer  "tagger_id"
    t.string   "tagger_type"
    t.string   "context"
    t.datetime "created_at"
  end

  add_index "taggings", ["tag_id"], :name => "index_taggings_on_tag_id"
  add_index "taggings", ["taggable_id", "taggable_type", "context"], :name => "index_taggings_on_taggable_id_and_taggable_type_and_context"

  create_table "tags", :force => true do |t|
    t.string "name"
  end

  create_table "users", :force => true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "login"
    t.string   "email",            :null => false
    t.string   "website"
    t.string   "facebook_account"
    t.string   "twitter_account"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], :name => "index_users_on_email"
  add_index "users", ["login"], :name => "index_users_on_login"

end
