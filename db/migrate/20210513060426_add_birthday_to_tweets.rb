class AddBirthdayToTweets < ActiveRecord::Migration[6.0]
  def change
    add_column :tweets, :birthday, :date
  end
end
