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

    factory :probationary do
      after(:build) do |user|
         user.add_role 'probationary'
       end
    end
  end


end
