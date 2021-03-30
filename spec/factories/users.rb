FactoryBot.define do
  factory :user do
    nickname                 { Faker::Lorem.sentence }
    email                    { Faker::Internet.free_email }
    password                 { '1a' + Faker::Internet.password(min_length: 6) }
    password_confirmation    { password }
    last_name                { '山ぬォ' }
    first_name               { 'ぃ宵じ' }
    last_name_kana           { 'ジエイケィ' }
    first_name_kana          { 'フェイジェイ' }
    birthday                 { Faker::Date.birthday }
  end
end
