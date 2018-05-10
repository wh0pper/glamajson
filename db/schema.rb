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

ActiveRecord::Schema.define(version: 2018_05_09_212224) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "challenges", force: :cascade do |t|
    t.string "type"
    t.string "descriptions"
    t.string "winner"
    t.bigint "episode_id"
    t.index ["episode_id"], name: "index_challenges_on_episode_id"
  end

  create_table "episodes", force: :cascade do |t|
    t.integer "number_in_series"
    t.integer "number_in_season"
    t.string "title"
    t.string "airdate"
    t.bigint "season_id"
    t.string "bottom_two"
    t.string "elimated"
    t.string "winner"
    t.string "lip_synch"
    t.index ["season_id"], name: "index_episodes_on_season_id"
  end

  create_table "episodes_queens", id: false, force: :cascade do |t|
    t.bigint "episode_id", null: false
    t.bigint "queen_id", null: false
    t.index ["episode_id", "queen_id"], name: "index_episodes_queens_on_episode_id_and_queen_id"
  end

  create_table "queens", force: :cascade do |t|
    t.string "name"
    t.string "real_name"
    t.string "city"
    t.integer "age"
  end

  create_table "queens_seasons", id: false, force: :cascade do |t|
    t.bigint "queen_id", null: false
    t.bigint "season_id", null: false
    t.index ["queen_id", "season_id"], name: "index_queens_seasons_on_queen_id_and_season_id"
  end

  create_table "quotes", force: :cascade do |t|
    t.string "content"
    t.bigint "queen_id"
    t.index ["queen_id"], name: "index_quotes_on_queen_id"
  end

  create_table "seasons", force: :cascade do |t|
    t.string "name"
    t.bigint "winner_id"
    t.index ["winner_id"], name: "index_seasons_on_winner_id"
  end

  add_foreign_key "seasons", "queens", column: "winner_id"
end
