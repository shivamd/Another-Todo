# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    sequence(:email) { |i| i.integer? ? Faker::Internet.email : i }
    password "password"
  end
end
