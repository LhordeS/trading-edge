class CreateSetupDefinitions < ActiveRecord::Migration[8.1]
  def change
    create_table :setup_definitions do |t|
      t.string :name, null: false
      t.text :description
      t.decimal :version, precision: 4, scale: 2
      t.boolean :active, null: false, default: true

      t.timestamps
    end
  end
end
