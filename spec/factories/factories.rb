
FactoryGirl.define do
  sequence :email do |n|
    "email#{n}@example.com"
  end
  sequence :phone do |n|
    "00111111111#{n}"
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

  sequence(:id, aliases: [:project_id, :user_id]) do |n|
    "#{n}"
  end

  factory :project_update do
    title 
    content "Here is some content for a project update"
    user_id 
    project_id
  end

end

