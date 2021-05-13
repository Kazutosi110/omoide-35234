class Record < ApplicationRecord
  belongs_to :user
  belongs_to :tweet
  has_one :purchase
end
