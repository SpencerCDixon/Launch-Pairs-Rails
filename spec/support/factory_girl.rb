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

  factory :profile do
    blog_url "http://www.cranberrycoder.com"
    facebook "http://www.facebook.com/spencercdixon"
    twitter "http://www.twitter.com/spencercdixon"
    github "http://www.github.com/spencercdixon"
    linked_in "http://www.linkedin.com/spencercdixon"
    phone_number "6178945641"
    email "spencercdixon@gmail.com"
    user
  end

end
