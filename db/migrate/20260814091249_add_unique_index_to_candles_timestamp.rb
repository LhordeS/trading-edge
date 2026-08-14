class AddUniqueIndexToCandlesTimestamp < ActiveRecord::Migration[8.1]
  def change
    add_index :candles, :timestamp, unique: true
  end
end
