require 'rails_helper'

RSpec.describe Post, type: :model do
  describe "creation" do
    before do
      @post = Post.create(date: Date.today, rationale: "something")
    end

    it "creates a post" do  
      expect(@post).to be_valid  
    end
    
    context "is not valid when" do
      it "date is empty" do
        @post.date = nil
        expect(@post).to_not be_valid
      end

       it "rationale is empty" do
        @post.rationale = nil
        expect(@post).to_not be_valid
      end
    end
  end
end
