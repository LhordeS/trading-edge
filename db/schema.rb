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

ActiveRecord::Schema[8.1].define(version: 2026_06_19_101007) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pg_catalog.plpgsql"

  create_table "market_events", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.string "direction"
    t.string "event_type", null: false
    t.jsonb "metadata", default: {}, null: false
    t.datetime "occurred_at", null: false
    t.decimal "price", precision: 12, scale: 4
    t.bigint "trading_day_id", null: false
    t.datetime "updated_at", null: false
    t.index ["trading_day_id"], name: "index_market_events_on_trading_day_id"
  end

  create_table "outcomes", force: :cascade do |t|
    t.decimal "close_price", precision: 12, scale: 4
    t.datetime "created_at", null: false
    t.integer "lookahead_minutes", null: false
    t.decimal "mae", precision: 12, scale: 4
    t.decimal "mfe", precision: 12, scale: 4
    t.decimal "r_multiple", precision: 8, scale: 3
    t.bigint "setup_occurrence_id", null: false
    t.boolean "stop_hit"
    t.boolean "target_hit"
    t.datetime "updated_at", null: false
    t.index ["setup_occurrence_id"], name: "index_outcomes_on_setup_occurrence_id"
  end

  create_table "setup_definitions", force: :cascade do |t|
    t.boolean "active", default: true, null: false
    t.datetime "created_at", null: false
    t.text "description"
    t.string "name", null: false
    t.datetime "updated_at", null: false
    t.decimal "version", precision: 4, scale: 2
  end

  create_table "setup_occurrences", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.string "direction"
    t.jsonb "metadata", default: {}, null: false
    t.bigint "setup_definition_id", null: false
    t.bigint "trading_day_id", null: false
    t.datetime "triggered_at", null: false
    t.datetime "updated_at", null: false
    t.index ["setup_definition_id"], name: "index_setup_occurrences_on_setup_definition_id"
    t.index ["trading_day_id"], name: "index_setup_occurrences_on_trading_day_id"
  end

  create_table "trading_days", force: :cascade do |t|
    t.decimal "atr14", precision: 12, scale: 4
    t.datetime "created_at", null: false
    t.date "date", null: false
    t.datetime "session_close"
    t.datetime "session_open"
    t.string "symbol", null: false
    t.datetime "updated_at", null: false
    t.index ["date", "symbol"], name: "index_trading_days_on_date_and_symbol", unique: true
  end

  add_foreign_key "market_events", "trading_days"
  add_foreign_key "outcomes", "setup_occurrences"
  add_foreign_key "setup_occurrences", "setup_definitions"
  add_foreign_key "setup_occurrences", "trading_days"
end
