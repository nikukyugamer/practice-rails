# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2020_01_09_025242) do
  create_table "article_authors", force: :cascade do |t|
    t.integer "article_id"
    t.integer "author_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["article_id", "author_id"], name: "index_article_authors_on_article_id_and_author_id", unique: true
    t.index ["article_id"], name: "index_article_authors_on_article_id"
    t.index ["author_id"], name: "index_article_authors_on_author_id"
  end

  create_table "articles", force: :cascade do |t|
    t.string "title", null: false
    t.string "sub_title"
    t.string "genre", default: "UNKNOWN", null: false
    t.datetime "published_at", precision: nil, default: "1970-01-01 03:00:00", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "authors", force: :cascade do |t|
    t.string "first_name", default: "UNKNOWN", null: false
    t.string "last_name", default: "UNKNOWN", null: false
    t.string "job", default: "UNKNOWN", null: false
    t.string "country", default: "UNKNOWN", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "members", force: :cascade do |t|
    t.string "firstname", default: "UNKNOWN", null: false
    t.string "lastname", default: "UNKNOWN", null: false
    t.integer "age", default: -1, null: false
    t.integer "sex", default: 0, null: false
    t.string "born_at_pref", default: "UNKNOWN", null: false
    t.boolean "is_japanese", default: true, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "punditers", force: :cascade do |t|
    t.string "name"
    t.string "place"
    t.integer "price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.integer "age"
    t.float "height"
    t.float "weight"
    t.text "foobar_data"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "article_authors", "articles"
  add_foreign_key "article_authors", "authors"
end
