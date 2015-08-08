FactoryGirl.define do
  factory :user do
    username "JohnDoe"
    first_name "John"
    last_name "Doe"
    sequence(:email) {|n| "jonndoe#{n}@example.com"}
    password "banana"
    zip_code 10004
    longitude 40.34
    latitude 47.93

    factory :invalid_user do
        first_name nil
    end
  end
end