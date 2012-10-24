# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :story do
    title {generate :string}
    description {generate :description}
    deadline {Time.current}
  end
end
