# frozen_string_literal: true

FactoryBot.define do
  factory :audit_log do
    user
    state { nil }
    start_date { 6.days.ago }
    end_date { nil }
  end
end
