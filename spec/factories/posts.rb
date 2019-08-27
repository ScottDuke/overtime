FactoryBot.define do
  factory :post do
    user
    date { Date.today }
    rationale { "something" }
    overtime_request { 4.0 }
  end

  factory :second_post, class: "Post" do
    user
    date { Date.yesterday }
    rationale { "something else" }
    overtime_request { 1.5 }
  end
end