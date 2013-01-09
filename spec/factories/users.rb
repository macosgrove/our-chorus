# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    email { Faker::Internet.email }
    password 'pword01'
    password_confirmation 'pword01'
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    username { Faker::Lorem.word }
    send_emails false

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
         user.add_role 'prospective'
       end
    end

  end


end
