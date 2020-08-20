FactoryBot.define do
  factory :product do
    name { "My Product" }
    description { "This is a product" }
    on_sale { false }
    price { "20.99" }
  end
end
