class RemovePreferredDayFromPurchases < ActiveRecord::Migration[6.0]
  def change
    remove_column :purchases, :preferred_day, :date
  end
end
