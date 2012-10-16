# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :story_comment do
    body "MyString"
    user_id 1
    story_id 1
  end
end
