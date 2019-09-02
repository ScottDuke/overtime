require 'rails_helper'

describe "navigate" do
  describe "homepage" do
    it "loads the page successfully" do
      visit root_path
      expect(page.status_code).to eql(200)
    end
  end
end
