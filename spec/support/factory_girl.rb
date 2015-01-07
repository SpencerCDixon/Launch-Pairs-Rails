require 'factory_girl'

FactoryGirl.define do
  factory :user do
    sequence(:email) {|n| "user#{n}@example.com" }
    first_name "John"
    last_name "Smith"
    password 'password'
    password_confirmation 'password'


    trait :dependencies do
      after(:build) do |u|
        u.projects << FactoryGirl.create(:project, user: u)
        u.statuses << FactoryGirl.create(:status, user: u)
      end
    end

    factory :complete_user, traits: [:dependencies]
  end

  factory :project do
    project 'In deep thought'
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

  factory :status do
    description "Sleeping"
    user

    factory :status_pair do
      description "Ready To Pair"
    end

    factory :status_zone do
      description "In The Zone"
    end

    factory :status_help do
      description "Open To Help"
    end
  end

end
