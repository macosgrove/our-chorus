# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    email { Faker::Internet.email }
    password 'pword01'
    password_confirmation 'pword01'

    factory :founder do
      after(:build) do |user|
         user.add_role 'founder'
       end
    end

    factory :full_member do
      after(:build) do |user|
         user.add_role 'full_member'
       end
    end

    factory :probationer do
      after(:build) do |user|
         user.add_role 'probationer'
       end
    end

    factory :prospective do
      after(:build) do |user|
         user.add_role 'probationer'
       end
    end

  end


end
