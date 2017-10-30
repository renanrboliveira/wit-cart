FactoryBot.define do
  factory :product do
    name { Faker::Name.name }
    price { Faker::Number.decimal(2) }
  end
end
