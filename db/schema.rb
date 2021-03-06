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

ActiveRecord::Schema.define(version: 20130827055921) do

  create_table "contacts", force: true do |t|
    t.string   "openid"
    t.string   "nickname"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "messagekeys", force: true do |t|
    t.string   "name"
    t.boolean  "isMatch"
    t.integer  "rolecard_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "messages", force: true do |t|
    t.string   "msgType"
    t.string   "content"
    t.string   "picUrl"
    t.string   "locationx"
    t.string   "locationy"
    t.string   "scale"
    t.string   "label"
    t.string   "title"
    t.string   "description"
    t.string   "url"
    t.integer  "rolecard_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "remessages", force: true do |t|
    t.string   "toUserName"
    t.string   "fromUserName"
    t.string   "createTime"
    t.string   "msgType"
    t.string   "content"
    t.string   "msgId"
    t.string   "picUrl"
    t.string   "locationx"
    t.string   "locationy"
    t.string   "scale"
    t.string   "label"
    t.string   "title"
    t.string   "description"
    t.string   "url"
    t.integer  "contact_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "rolecards", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "username"
    t.string   "password"
    t.string   "realname"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
