# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :story do
    title "MyString"
    description "MyString"
    state "MyString"
    deadline "2012-10-08 16:45:32"
    performer_id 1
    creator_id 1
  end
end
