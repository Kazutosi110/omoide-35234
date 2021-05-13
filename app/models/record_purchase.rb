class RecordPurchase
  include ActiveModel::Model
  attr_accessor :user_id, :tweet_id, :hate_list, :people_id, :token

  with_options presence: true do
    validates :user_id
    validates :tweet_id
    validates :token
    validates :people_id, numericality: { other_than: 1, message: "can't be blank" }
  end

  def save
    record = Record.create(user_id: user_id, tweet_id: tweet_id)
    Purchase.create(hate_list: hate_list, people_id: people_id, record_id: record.id)
  end
end