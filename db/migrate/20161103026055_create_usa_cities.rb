class CreateUsaCities < ActiveRecord::Migration[5.0]
  def change
    create_table :usa_cities do |t|
      t.string :name
      t.string :state
      t.integer :zip_code
      t.float :latitude
      t.float :longitude

      t.timestamps
    end
  end
end
