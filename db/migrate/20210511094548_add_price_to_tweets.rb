class AddPriceToTweets < ActiveRecord::Migration[6.0]
  def change
    add_column :tweets, :price, :integer
  end
end
