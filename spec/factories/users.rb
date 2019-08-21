FactoryGirl.define do
  factory :user do
    first_name "test"
    last_name "testy"
    email "test@example.com"
    password "password"
    password_confirmation "password"
  end

  factory :admin_user, model: "AdminUser" do
    first_name "test"
    last_name "admin"
    email "admin@example.com"
    password "password"
    password_confirmation "password"
  end
end