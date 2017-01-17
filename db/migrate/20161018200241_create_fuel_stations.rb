class CreateFuelStations < ActiveRecord::Migration[5.0]
  def change
    create_table :fuel_stations do |t|
      t.string :name
      t.float :latitude
      t.float :longitude
      t.text :address
      t.string :phone_number
      t.text :comments
      t.string :color_code
      t.boolean :is_active

      t.timestamps
    end
  end
end
