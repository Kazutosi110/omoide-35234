class People < ActiveHash::Base
  self.data = [
    { id: 1, name: '---' },
    { id: 2, name: '1人' }, { id: 3, name: '1人から2人' }, { id: 4, name: '3〜4人' },
    { id: 5, name: '6人以内' }, { id: 6, name: '10人以上' },
  ]

  include ActiveHash::Associations
  has_many :purchases
end