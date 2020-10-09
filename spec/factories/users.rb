FactoryBot.define do
  factory :user do
    nickname              {Faker::Name.initials(number: 2)}
    email                 {Faker::Internet.free_email}
    password              {Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
    firstname             {Faker::Name.name}
    lastname              {Faker::Name.name}
    kana_firstname        {Faker::Name.name}
    kana_lastname         {Faker::Name.name}
    birthday              {Faker::Date.birthday(min_age: 18, max_age: 65)}
  end
end
