class RemoveTradingDayFromCandles < ActiveRecord::Migration[8.1]
  def change
    remove_reference :candles, :trading_day, null: false, foreign_key: true
  end
end
