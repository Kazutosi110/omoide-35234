FactoryBot.define do
  factory :record_purchase do
    people_id { 3 }
    hate_list {Faker::Lorem.sentence}
    token {"tok_abcdefghijk00000000000000000"}
  end
end
