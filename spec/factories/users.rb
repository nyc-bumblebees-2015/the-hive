require 'faker'

FactoryGirl.define do
  factory :user do
    username {Faker::Internet.user_name}
    first_name 'Jason'
    last_name "Guzik"
    email {Faker::Internet.email}
    password 'banana'
    password_confirmation {password}
    zip_code '56789'
    longitude 40.56
    latitude 64.94

    factory :invalid_user do
        first_name nil
    end
  end
end