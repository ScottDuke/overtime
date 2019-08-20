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
end
