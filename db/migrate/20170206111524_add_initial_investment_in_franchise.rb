class AddInitialInvestmentInFranchise < ActiveRecord::Migration[5.0]
  def change
    add_column :franchises, :initial_investment, :string
  end
end
