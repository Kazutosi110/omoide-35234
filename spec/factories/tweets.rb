FactoryBot.define do
  factory :tweet do
    store_name            { "どすこい" }
    store_type            { "焼肉" }
    information           { Faker::Lorem.sentence }
    place_area_id         { 5 }
    phone                 { "09012345678" }
    association :user

    after(:build) do |tweet|
      tweet.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
