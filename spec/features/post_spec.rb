require 'rails_helper'

describe "navigate" do
  let(:user) { FactoryBot.create(:user) }

  before do
    login_as(user, scope: :user)
  end

  describe "index" do
    before do
      FactoryBot.create(:post)
      FactoryBot.create(:second_post)
      visit posts_path
    end

    it "loads the page successfully" do
      expect(page.status_code).to eql(200)  
    end

    it "has a title of Posts" do
      expect(page).to have_content("Posts")
    end
    
    it "has a list of Posts" do
      expect(page).to have_content(/something|something\selse/)
    end
  end

  describe "create" do
    before do
      visit new_post_path
    end

    it "loads the new page" do
      expect(page.status_code).to eql(200)
    end

    it "creates a post from the new form page" do      
      fill_in "post[date]",	with: Date.today
      fill_in "post[rationale]",	with: "some text"
      click_on "Save"

      expect(page).to have_content("some text")
    end

    it "will have a user associated" do
      expected_rationale_value = "some text"
      fill_in "post[date]",	with: Date.today
      fill_in "post[rationale]",	with: expected_rationale_value
      click_on "Save"

      actual_rationale_value = User.last.posts.last.rationale
      expect(actual_rationale_value).to eql(expected_rationale_value)
    end
  end
  
end
