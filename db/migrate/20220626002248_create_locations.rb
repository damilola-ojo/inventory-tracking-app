class CreateLocations < ActiveRecord::Migration[7.0]
  def change
    create_table :locations do |t|
      t.string :name
      t.string :address
      t.string :city
      t.string :country
      t.references :inventory, null: false, foreign_key: true

      t.timestamps
    end
  end
end
