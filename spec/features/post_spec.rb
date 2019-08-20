require 'rails_helper'

describe "navigate" do
  describe "index" do

    it "loads the page successfully" do
      visit posts_path
      expect(page.status_code).to eql(200)  
    end

    it "has a title of Posts" do
      visit posts_path
      expect(page).to have_content("Posts")
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
  end
  
end
