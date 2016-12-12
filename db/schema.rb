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

ActiveRecord::Schema.define(version: 20161211171128) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "evaluations", force: :cascade do |t|
    t.integer  "r1"
    t.integer  "r2"
    t.integer  "r3"
    t.integer  "r4"
    t.integer  "r5"
    t.integer  "r6"
    t.integer  "r7"
    t.integer  "r8"
    t.integer  "r9"
    t.integer  "r10"
    t.integer  "r11"
    t.integer  "r12"
    t.integer  "r13"
    t.integer  "r14"
    t.integer  "r15"
    t.integer  "r16"
    t.integer  "r17"
    t.integer  "r18"
    t.integer  "r19"
    t.integer  "r20"
    t.integer  "r21"
    t.integer  "r22"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
