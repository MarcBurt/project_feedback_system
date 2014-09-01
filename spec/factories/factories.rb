
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

  sequence :title do |n|
    "title#{n}"
  end

  factory :project_update do
    title 
    content "Here is some content for a project update"
  end

end

