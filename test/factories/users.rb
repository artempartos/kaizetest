# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    name            {generate :name}
    email           {generate :email}
    password        {generate :string}
  end

end
