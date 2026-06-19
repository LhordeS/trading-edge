class CreateOutcomes < ActiveRecord::Migration[8.1]
  def change
    create_table :outcomes do |t|
      t.references :setup_occurrence, null: false, foreign_key: true
      t.integer :lookahead_minutes, null: false
      t.decimal :mfe, precision: 12, scale: 4
      t.decimal :mae, precision: 12, scale: 4
      t.decimal :r_multiple, precision: 8, scale: 3
      t.decimal :close_price, precision: 12, scale: 4
      t.boolean :target_hit
      t.boolean :stop_hit

      t.timestamps
    end
  end
end
