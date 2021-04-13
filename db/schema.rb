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

ActiveRecord::Schema.define(version: 2021_04_13_024338) do

  create_table "golf_courses", force: :cascade do |t|
    t.string "name"
    t.string "location"
    t.string "phone_number"
    t.string "number_of_holes"
    t.integer "scorecard"
    t.integer "front_9"
    t.integer "back_9"
  end

  create_table "golfers", force: :cascade do |t|
    t.string "name"
    t.string "hometown"
    t.string "username"
    t.string "password_digest"
    t.float "handicap"
  end

end
