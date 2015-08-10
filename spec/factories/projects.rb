require 'faker'

FactoryGirl.define do
  factory :project do
    creator_id 1
    title {Faker::Hacker.adjective}
    description {Faker::Hacker.say_something_smart}
    start_date {Faker::Date.between(2.days.ago, Date.today)}
    end_date {Faker::Date.forward(20)}
    status 'planning'
    skills_desired 'be smart'

    factory :invalid_project do
      title nil
    end

  end
end