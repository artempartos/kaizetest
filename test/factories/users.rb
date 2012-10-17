# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    name            "Name"
    email           "email@gmail.com"
    password        "password"
  end

end
