class RemoveStartingTimeFromPurchases < ActiveRecord::Migration[6.0]
  def change
    remove_column :purchases, :starting_time, :datetime
  end
end
