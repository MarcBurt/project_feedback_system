

FactoryGirl.define do
  sequence :email do |n|
    "email#{n}@example.com"
  end
  sequence :phone do |n|
    "0011111111111#{n}"
  end

  factory :user do
    first_name "John"
    last_name "smith"
    phone 
    email
    role "donor"
  end

  sequence :name do |n|
    "project#{n}"
  end

  factory :project do
    name
  end  
end

