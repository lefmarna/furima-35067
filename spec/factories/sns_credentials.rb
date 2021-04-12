FactoryBot.define do
  factory :sns_credential do
    provider           { Faker::Lorem.sentence }
    uid                { Faker::Number.number(digits: 15) }
    association :user
  end
end
