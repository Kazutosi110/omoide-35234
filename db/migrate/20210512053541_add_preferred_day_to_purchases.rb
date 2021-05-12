class AddPreferredDayToPurchases < ActiveRecord::Migration[6.0]
  def change
    add_column :purchases, :preferred_day, :date
  end
end
