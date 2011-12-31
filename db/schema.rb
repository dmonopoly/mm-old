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

ActiveRecord::Schema.define(:version => 20111231042222) do

  create_table "locations", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "memories", :force => true do |t|
    t.text     "content"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "location_id"
  end

  create_table "memory_time_frames", :force => true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "memory_id"
    t.integer  "time_frame_id"
  end

  create_table "time_frames", :force => true do |t|
    t.string   "representation"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.date     "first_date"
    t.integer  "first_date_type"
    t.date     "second_date"
    t.integer  "second_date_type"
  end

end
