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

ActiveRecord::Schema.define(version: 20170201182524) do

  create_table "albums", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "title",      limit: 100
    t.integer  "year",                   default: 0
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.boolean  "active",                 default: false
    t.integer  "band_id"
    t.index ["band_id"], name: "index_albums_on_band_id", using: :btree
    t.index ["title"], name: "index_albums_on_title", using: :btree
  end

  create_table "bands", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name",       limit: 50
    t.string   "website",               default: ""
    t.datetime "created_at",                            null: false
    t.datetime "updated_at",                            null: false
    t.boolean  "active",                default: false
    t.index ["name"], name: "index_bands_on_name", using: :btree
  end

  create_table "power_users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "first_name",      limit: 25
    t.string   "last_name",       limit: 25
    t.string   "email",           limit: 100
    t.string   "password_digest"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.index ["email"], name: "index_power_users_on_email", using: :btree
  end

end
