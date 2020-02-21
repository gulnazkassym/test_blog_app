FactoryBot.define do
  factory :post do
    title { Faker::Lorem.word }
    subtitle { Faker::Lorem.sentence }
    text { Faker::Lorem.paragraph }
    is_published { true }
  end
end