class CreateFranchises < ActiveRecord::Migration[5.0]
  def change
    create_table :franchises do |t|
      t.string :factual_id
      t.string :name
      t.text :address
      t.string :locality
      t.string :region
      t.string :post_code
      t.string :country
      t.string :telephone
      t.string :website
      t.float :latitude
      t.float :longitude
      t.text :hours_of_operations
      t.text :category_labels
      t.string :chain_name

      t.timestamps
    end
  end
end
