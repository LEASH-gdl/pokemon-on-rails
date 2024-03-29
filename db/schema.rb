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

ActiveRecord::Schema[7.0].define(version: 2023_05_25_051348) do
  create_table "items", force: :cascade do |t|
    t.string "name"
    t.integer "amount"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id", null: false
    t.index ["user_id"], name: "index_items_on_user_id"
  end

  create_table "pokemon_types", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "pokemon_types_pokemons", id: false, force: :cascade do |t|
    t.integer "pokemon_id"
    t.integer "pokemon_type_id"
    t.index ["pokemon_id"], name: "index_pokemon_types_pokemons_on_pokemon_id"
    t.index ["pokemon_type_id"], name: "index_pokemon_types_pokemons_on_pokemon_type_id"
  end

  create_table "pokemons", force: :cascade do |t|
    t.string "name"
    t.integer "api_id"
    t.string "image"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id", null: false
    t.index ["user_id"], name: "index_pokemons_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "confirmed_at"
    t.string "password_digest", null: false
  end

  add_foreign_key "items", "users"
  add_foreign_key "pokemons", "users"
end
