FactoryBot.define do
  factory :user do
    username { Faker::Internet.email }
    password {'password'}
    fullname {'User User'}
  end
end