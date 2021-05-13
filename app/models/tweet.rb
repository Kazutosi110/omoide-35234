class Tweet < ApplicationRecord

  validates :store_name, presence: true
  validates :store_type, presence: true
  validates :information, presence: true
  validates :phone, presence: true
  validates :image, presence: true
  validates :price, presence: true
  validates :birthday, presence: true
  validates :phone, format: { with: /\A\d{10,11}\z/, message: 'is invalid.' }
  validates :price, inclusion: { in: 300..9_999_999 }, format: { with: /\A[0-9]+\z/ }, numericality: true
  validates :place_area_id, numericality: { other_than: 1 }

  belongs_to :user
  has_one_attached :image
  has_many :comments, dependent: :destroy
  has_one :record

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :place_area

  def self.search(search)
    if search != ""
      Tweet.joins(:user).where(['name LIKE(?) OR age LIKE(?)', "%#{search}%", "%#{search}%"])
    else
      Tweet.includes(:user).order("created_at DESC")
    end
  end
end
