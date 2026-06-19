class CreateMarketEvents < ActiveRecord::Migration[8.1]
  def change
    create_table :market_events do |t|
      t.references :trading_day, null: false, foreign_key: true
      t.string :event_type, null: false
      t.datetime :occurred_at, null: false
      t.decimal :price, precision: 12, scale: 4
      t.string :direction
      t.jsonb :metadata

      t.timestamps
    end
  end
end
