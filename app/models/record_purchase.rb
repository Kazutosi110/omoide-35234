class RecordPurchase
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :starting_time, :ending_time, :hate_list, :people_id

  with_options presence: true do
    validates :user_id
    validates :tweet_id
    validates :starting_time
    validates :ending_time
    validates :people_id, numericality: { other_than: 1, message: "can't be blank" }
  end

  def save
    record = Record.create(user_id: user_id, tweet_id: tweet_id)
    Purchase.create(starting_time: starting_time, ending_time: ending_time, hate_list: hate_list, people_id: people_id, record_id: record.id)
  end
end