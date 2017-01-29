class CreateFranchises < ActiveRecord::Migration[5.0]
  def change
    create_table :franchises do |t|
      t.string :name
      t.integer :rank
      t.boolean :is_client
      t.string :website
      t.string :logo

      t.timestamps
    end
  end
end
