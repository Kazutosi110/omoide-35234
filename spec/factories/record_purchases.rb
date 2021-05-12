FactoryBot.define do
  factory :record_purchase do
    people_id { 3 }
    hate_list {Faker::Lorem.sentence}
  end
end
