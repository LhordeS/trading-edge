class CreateCandles < ActiveRecord::Migration[8.1]
  def change
    create_table :candles do |t|
      t.references :trading_day, null: false, foreign_key: true

      t.datetime :timestamp, null: false

      t.decimal :open, null: false
      t.decimal :high, null: false
      t.decimal :low, null: false
      t.decimal :close, null: false

      t.integer :volume

      t.timestamps
    end

    add_index :candles, [:trading_day_id, :timestamp], unique: true
  end
end
