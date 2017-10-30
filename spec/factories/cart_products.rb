FactoryBot.define do
  factory :cart_product do
    quantity { Faker::Number.between(1, 10)}
    price { Faker::Number.decimal(2) }    
    user_cart
    product
  end
end
