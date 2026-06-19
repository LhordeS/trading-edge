class CreateTradingDays < ActiveRecord::Migration[8.1]
  def change
    create_table :trading_days do |t|
      t.date :date, null: false
      t.string :symbol, null: false
      t.decimal :atr14, precision: 12, scale: 4
      t.datetime :session_open
      t.datetime :session_close
      t.index [:date, :symbol], unique: true

      t.timestamps
    end
  end
end
