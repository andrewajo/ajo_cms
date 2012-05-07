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

ActiveRecord::Schema.define(:version => 20120507145241) do

  create_table "ajo_cms_companies", :force => true do |t|
    t.string   "title"
    t.string   "name"
    t.string   "address"
    t.string   "city"
    t.string   "state"
    t.string   "country"
    t.string   "phone"
    t.string   "fax"
    t.string   "email"
    t.string   "zip_code"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.string   "province"
    t.string   "contact"
    t.string   "logo"
    t.string   "layout"
    t.string   "theme"
  end

  create_table "ajo_cms_copies", :force => true do |t|
    t.string   "title"
    t.text     "content"
    t.integer  "section_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "ajo_cms_pages", :force => true do |t|
    t.string   "name"
    t.string   "title"
    t.string   "layout"
    t.integer  "section_id"
    t.boolean  "index_page"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "position"
  end

  create_table "ajo_cms_posts", :force => true do |t|
    t.string   "title"
    t.text     "content"
    t.string   "post_type"
    t.integer  "page_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.string   "image"
    t.date     "date"
    t.integer  "position"
    t.string   "file"
  end

  create_table "ajo_cms_sections", :force => true do |t|
    t.string   "name"
    t.string   "title"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "position"
  end

  create_table "ajo_cms_users", :force => true do |t|
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

end
