FactoryGirl.define do
  factory :post do
    date Date.today
    rationale "something"
  end

  factory :second_post, model: "Post" do
    date Date.yesterday
    rationale "something else"
  end
end