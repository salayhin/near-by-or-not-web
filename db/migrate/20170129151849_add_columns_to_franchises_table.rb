class AddColumnsToFranchisesTable < ActiveRecord::Migration[5.0]
  def change
    add_column :franchises, :category_labels, :text
    add_column :franchises, :chain_name, :string
  end
end
