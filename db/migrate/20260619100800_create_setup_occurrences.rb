class CreateSetupOccurrences < ActiveRecord::Migration[8.1]
  def change
    create_table :setup_occurrences do |t|
      t.references :trading_day, null: false, foreign_key: true
      t.references :setup_definition, null: false, foreign_key: true
      t.string :direction
      t.datetime :triggered_at, null: false
      t.jsonb :metadata, default: {}, null: false

      t.timestamps
    end
  end
end
