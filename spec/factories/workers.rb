FactoryBot.define do
  factory :worker do
    name { Faker::Name.name }
    company_name { Faker::Lorem.word }
    email { Faker::Internet.email }
  end
end
