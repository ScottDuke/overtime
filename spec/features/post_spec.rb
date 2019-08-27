require 'rails_helper'

describe "navigate" do
  let(:user) { FactoryBot.create(:user) }

  before do
    login_as(user, scope: :user)
  end

  describe "index" do
    let!(:post1) { FactoryBot.create(:post, user: user) }
    let!(:post2) { FactoryBot.create(:second_post, user: user) }

    before do
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

  describe "edit" do
    let!(:post) { FactoryBot.create(:post, user: user) }

    it "can be reached by clicking edit on index page" do
      visit posts_path

      click_link "edit_#{post.id}"  

      expect(page.status_code).to eq(200)
    end

    it "can be edited" do
      rationale_content = "UPDATED: some text"

      visit edit_post_path(post)

      fill_in "post[date]",	with: Date.today
      fill_in "post[rationale]",	with: rationale_content
      click_on "Save"

      expect(page).to have_content(rationale_content)
    end

    it "cannot be edited by a non authorised user" do
      logout(:user)
      second_user = FactoryBot.create(:second_user)
      login_as(second_user, scope: :user)

      visit edit_post_path(post)

      expect(current_path).to eq(root_path)
    end
  end

  describe "new" do
    it "has a link from the homepage" do
      visit root_path

      click_link("new-post-from-nav")

      expect(page.status_code).to eq(200)
    end
  end

  describe "delete" do
    let!(:post) { FactoryBot.create(:post, user: user) }

    it "has a link to delete" do
      visit posts_path

      expect(page).to have_link("Delete", href: post_path(post))
    end

    it "can be deleted" do
      visit posts_path

      click_link "delete_#{post.id}"

      expect(page.status_code).to eq(200)
    end
  end
  
end
