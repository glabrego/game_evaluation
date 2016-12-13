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

ActiveRecord::Schema.define(version: 20161213101142) do

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
    t.integer  "game_id"
    t.index ["game_id"], name: "index_evaluations_on_game_id", using: :btree
  end

  create_table "games", force: :cascade do |t|
    t.string   "name"
    t.string   "description"
    t.float    "easy_of_use"
    t.float    "content_quality"
    t.float    "versatility"
    t.float    "pedagogical_aspects"
    t.float    "didactical_resources"
    t.float    "stimulates_the_initiative_and_self_learning"
    t.float    "audiovisual_quality"
    t.float    "technical_and_static_elements"
    t.float    "navigation_and_interaction"
    t.float    "originality_and_use_of_advanced_tecnology"
    t.datetime "created_at",                                  null: false
    t.datetime "updated_at",                                  null: false
    t.string   "link"
    t.string   "how_to_play"
  end

  create_table "researchers", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "name"
    t.index ["email"], name: "index_researchers_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_researchers_on_reset_password_token", unique: true, using: :btree
  end

  add_foreign_key "evaluations", "games"
end
