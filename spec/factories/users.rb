FactoryGirl.define do
  factory :user do
    username { Faker::Internet.user_name}
    first_name { Faker::Name.first_name}
    last_name { Faker::Name.last_name}
    email { Faker::Internet.email}
    password 'banana'
    password_confirmation 'banana'
    zip_code '56789'
    longitude { Faker::Address.longitude}
    latitude { Faker::Address.latitude}

    factory :invalid_user do
        first_name nil
    end
  end
end