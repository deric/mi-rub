# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :author do
    firstname "John"
    surname "Doe"
    title_before "Ing. et Bc."
    title_after "PhD."
  end
end
