class Tweet < ApplicationRecord

  validates :store_name, presence: true
  validates :store_type, presence: true
  validates :information, presence: true
  validates :phone, presence: true
  validates :image, presence: true
  validates :phone, format: { with: /\A\d{10,11}\z/, message: 'is invalid.' }

  belongs_to :user
  has_one_attached :image
end
