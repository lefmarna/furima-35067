FactoryBot.define do
  factory :order_address do
    zip           { "#{Faker::Number.number(digits: 3)}-#{Faker::Number.number(digits: 4)}" }
    prefecture    { Faker::Number.number(digits: 2) }
    city          { Faker::Address.city }
    address_line1 { Faker::Address.street_address }
    address_line2 { Faker::Address.secondary_address }
    phone_number  { Faker::Number.number(digits: 11).to_s }
    token         { "tok_#{Faker::Lorem.characters(min_alpha: 1, min_numeric: 1)}" }
  end
end
