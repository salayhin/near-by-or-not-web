class RenameFranchiseToFranchiseLocation < ActiveRecord::Migration[5.0]
  def change
    rename_table :franchises, :franchise_locations
  end
end
