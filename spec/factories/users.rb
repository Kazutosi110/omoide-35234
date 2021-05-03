FactoryBot.define do
  factory :user do
    name                  { Faker::Name.name }
    email                 { Faker::Internet.free_email }
    password              { 'abab22' }
    password_confirmation { password }
    profile               { '乃木坂46のファンです' }
    age                   { 24 }
  end
end
