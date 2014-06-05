# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :task do
    name "MyString"
    completed false
    due_date "2014-06-05 14:22:16"
    user_id 1
  end
end
