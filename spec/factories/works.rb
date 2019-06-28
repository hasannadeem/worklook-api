FactoryBot.define do
  factory :work do
    title { Faker::Lorem.word }
    description { Faker::Lorem.paragraph(2) }
    deadline { Faker::Date.forward(23) }
  end
end
