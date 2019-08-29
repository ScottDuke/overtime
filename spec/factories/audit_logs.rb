FactoryBot.define do
  factory :audit_log do
    user { nil }
    state { "MyString" }
    start_date { "2019-08-29" }
    end_date { "2019-08-29" }
  end
end
