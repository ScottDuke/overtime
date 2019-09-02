# frozen_string_literal: true

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
    phone_number { "01159016500" }
  end

  factory :second_user, class: "User" do
    first_name { "Sam" }
    last_name  { "Testy" }
    email { generate :email }
    password { "password" }
    password_confirmation { "password" }
    phone_number { "01167156869" }
  end

  factory :admin_user, class: "AdminUser" do
    first_name { "test" }
    last_name { "admin" }
    email { generate :email }
    password_confirmation { "password" }
    password { "password" }
    phone_number { "01217072206" }
  end
end
