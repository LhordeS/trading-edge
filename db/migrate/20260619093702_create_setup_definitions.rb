class CreateSetupDefinitions < ActiveRecord::Migration[8.1]
  def change
    create_table :setup_definitions do |t|
      t.string :name
      t.text :description
      t.decimal :version, precision: 4, scale: 2
      t.boolean :active

      t.timestamps
    end
  end
end
