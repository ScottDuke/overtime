FactoryBot.define do
  sequence :email do |n|
    "test#{n}@example.com"
  end

  factory :user do
    first_name { "test" }
    last_name  { "testy" }
    email { generate :email }
    password { "password" }
    password_confirmation { "password" }
  end

  factory :admin_user, class: "AdminUser" do
    first_name { "test" }
    last_name { "admin" }
    email { generate :email }
    password_confirmation { "password" }
    password { "password" }
  end
end