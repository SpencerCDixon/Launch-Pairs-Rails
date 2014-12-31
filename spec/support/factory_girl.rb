require 'factory_girl'

FactoryGirl.define do
  factory :user do
    sequence(:email) {|n| "user#{n}@example.com" }
    first_name "John"
    last_name "Smith"
    password 'password'
    password_confirmation 'password'
  end

  factory :project do
    project 'Finishing up Launch Pairs'
    user
  end

end
