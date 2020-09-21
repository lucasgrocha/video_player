FactoryBot.define do
  factory :user do
    name                  { FFaker::Name.html_safe_name }
    email                 { FFaker::Internet.email }
    password              { 123456 }
    password_confirmation { 123456 }
  end
end
