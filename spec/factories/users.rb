FactoryBot.define do
  factory :user do
    nickname                 { Faker::Lorem.sentence }
    email                    { Faker::Internet.free_email }
    password                 { Faker::Internet.password(min_length: 6) }
    password_confirmation    { password }
    last_name                { Faker::Lorem.sentence }
    first_name               { Faker::Lorem.sentence }
    last_name_kana           { Faker::Lorem.sentence }
    first_name_kana          { Faker::Lorem.sentence }
    birthday                 { Faker::Date.birthday }
  end
end
