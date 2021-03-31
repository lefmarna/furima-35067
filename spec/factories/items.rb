FactoryBot.define do
  factory :item do
    name                  { Faker::Name.name }
    description           { Faker::Lorem.sentence }
    category_id           { Faker::Number.number(digits: 3) }
    status_id             { Faker::Number.number(digits: 3) }
    shipping_fee_id       { Faker::Number.number(digits: 3) }
    prefecture_id         { Faker::Number.number(digits: 3) }
    scheduled_delivery_id { Faker::Number.number(digits: 3) }
    price                 { Faker::Number.number(digits: 7) }
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('app/assets/images/dl-android.png'), filename: 'dl-android.png')
    end
  end
end
