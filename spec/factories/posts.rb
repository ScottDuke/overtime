FactoryBot.define do
  factory :post do
    user
    date { Date.today }
    rationale { "something" }
    
  end

  factory :second_post, class: "Post" do
    user
    date { Date.yesterday }
    rationale { "something else" }
  end
end