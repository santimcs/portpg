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

ActiveRecord::Schema.define(version: 20180505095413) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "charts", force: :cascade do |t|
    t.string "name"
    t.integer "year"
    t.integer "quarter"
    t.string "image_q"
    t.string "image_y"
    t.bigint "ticker_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name", "year", "quarter"], name: "index_charts_on_name_and_year_and_quarter", unique: true
    t.index ["ticker_id"], name: "index_charts_on_ticker_id"
  end

  create_table "consensus", force: :cascade do |t|
    t.string "name"
    t.decimal "price", precision: 6, scale: 2
    t.integer "buy"
    t.integer "hold"
    t.integer "sell"
    t.decimal "eps_a"
    t.decimal "eps_b"
    t.decimal "pe"
    t.decimal "pbv"
    t.decimal "yield"
    t.decimal "target_price", precision: 6, scale: 2
    t.string "status"
    t.bigint "ticker_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_consensus_on_name", unique: true
    t.index ["ticker_id"], name: "index_consensus_on_ticker_id"
  end

  create_table "epss", force: :cascade do |t|
    t.string "name"
    t.integer "year"
    t.integer "quarter"
    t.integer "q_amt"
    t.integer "y_amt"
    t.integer "aq_amt"
    t.integer "ay_amt"
    t.decimal "q_eps", precision: 8, scale: 6
    t.decimal "y_eps", precision: 8, scale: 6
    t.decimal "aq_eps", precision: 8, scale: 6
    t.decimal "ay_eps", precision: 8, scale: 6
    t.bigint "ticker_id"
    t.date "publish_date"
    t.index ["name", "year", "quarter"], name: "index_epss_on_name_and_year_and_quarter", unique: true
    t.index ["ticker_id"], name: "index_epss_on_ticker_id"
  end

  create_table "portfolios", force: :cascade do |t|
    t.string "name"
    t.date "date"
    t.integer "buy_qty"
    t.integer "sell_qty"
    t.integer "comp_qty"
    t.integer "att_qty"
    t.decimal "buy_unit_cost", precision: 6, scale: 2
    t.decimal "comp_unit_cost", precision: 6, scale: 2
    t.decimal "att_unit_cost", precision: 6, scale: 2
    t.decimal "buy_cost_amt"
    t.decimal "comp_cost_amt"
    t.decimal "att_cost_amt"
    t.decimal "last_sell_price", precision: 6, scale: 2
    t.decimal "target_sell_price", precision: 6, scale: 2
    t.integer "buy_method"
    t.integer "sell_method"
    t.bigint "ticker_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_portfolios_on_name", unique: true
    t.index ["ticker_id"], name: "index_portfolios_on_ticker_id"
  end

  create_table "profits", force: :cascade do |t|
    t.string "name"
    t.integer "year"
    t.integer "quarter"
    t.integer "kind"
    t.integer "latest_amt_y"
    t.integer "previous_amt_y"
    t.integer "inc_amt_y"
    t.decimal "inc_pct_y"
    t.integer "latest_amt_q"
    t.integer "previous_amt_q"
    t.integer "inc_amt_q"
    t.decimal "inc_pct_q"
    t.integer "q_amt_c"
    t.integer "y_amt"
    t.integer "inc_amt_py"
    t.decimal "inc_pct_py"
    t.integer "q_amt_p"
    t.integer "inc_amt_pq"
    t.decimal "inc_pct_pq"
    t.decimal "mean_pct"
    t.decimal "std_pct"
    t.date "publish_date"
    t.bigint "ticker_id"
    t.index ["name", "year", "quarter"], name: "index_profits_on_name_and_year_and_quarter", unique: true
    t.index ["ticker_id"], name: "index_profits_on_ticker_id"
  end

  create_table "stocks", force: :cascade do |t|
    t.string "name"
    t.string "market"
    t.decimal "price", precision: 6, scale: 2
    t.decimal "max_price", precision: 6, scale: 2
    t.decimal "min_price", precision: 6, scale: 2
    t.decimal "pe"
    t.decimal "pbv"
    t.decimal "paid_up"
    t.decimal "market_cap"
    t.decimal "daily_volume"
    t.decimal "beta"
    t.bigint "ticker_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_stocks_on_name", unique: true
    t.index ["ticker_id"], name: "index_stocks_on_ticker_id"
  end

  create_table "tickers", force: :cascade do |t|
    t.string "name"
    t.string "full_name"
    t.string "sector"
    t.string "subsector"
    t.string "market"
    t.string "website"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_tickers_on_name", unique: true
  end

  create_table "yr_profits", force: :cascade do |t|
    t.string "name"
    t.integer "year"
    t.integer "quarter"
    t.integer "latest_amt"
    t.integer "previous_amt"
    t.integer "inc_amt"
    t.decimal "inc_pct"
    t.bigint "ticker_id"
    t.index ["name", "year", "quarter"], name: "index_yr_profits_on_name_and_year_and_quarter", unique: true
    t.index ["ticker_id"], name: "index_yr_profits_on_ticker_id"
  end

  add_foreign_key "charts", "tickers"
  add_foreign_key "consensus", "tickers"
  add_foreign_key "epss", "tickers"
  add_foreign_key "portfolios", "tickers"
  add_foreign_key "profits", "tickers"
  add_foreign_key "stocks", "tickers"
  add_foreign_key "yr_profits", "tickers"
end
