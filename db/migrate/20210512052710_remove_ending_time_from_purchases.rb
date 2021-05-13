class RemoveEndingTimeFromPurchases < ActiveRecord::Migration[6.0]
  def change
    remove_column :purchases, :ending_time, :datetime
  end
end
