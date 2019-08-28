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
    phone_number { "0124015124" }
  end

  factory :second_user, class: "User" do
    first_name { "Sam" }
    last_name  { "Testy" }
    email { generate :email }
    password { "password" }
    password_confirmation { "password" }
    phone_number { "5423423412" }
  end

  factory :admin_user, class: "AdminUser" do
    first_name { "test" }
    last_name { "admin" }
    email { generate :email }
    password_confirmation { "password" }
    password { "password" }
    phone_number { "01240155234" }
  end
end