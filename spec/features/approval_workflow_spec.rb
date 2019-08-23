require 'rails_helper'

describe "Approval workflow" do
  let!(:admin_user) { FactoryBot.create(:admin_user) }
  
  before do
    login_as(admin_user, scope: :user)
  end

  describe "edit" do
    let!(:post) { FactoryBot.create(:post) }

    before do
      visit edit_post_path(post)
    end

    it "cannot be edited by a non admin" do
      logout(:user)

      user = FactoryBot.create(:user)
      login_as(user, scope: :user)

      visit edit_post_path(post)

      expect(page).to have_no_content("Submit")
      expect(page.has_field?("post_state_event_submit", type: "radio")).to be_falsey
      expect(page).to have_no_content("Approve")
      expect(page.has_field?("post_state_event_accept", type: "radio")).to be_falsey
      expect(page).to have_no_content("Reject")
      expect(page.has_field?("post_state_event_reject", type: "radio")).to be_falsey
    end

    context "when in a submitted state" do
      it "sets the post to a approved state" do
        choose "post_state_event_accept"
        click_button "Save"

        post.reload

        expect(post.approved?).to be_truthy  
      end

      it "sets the post to a rejected state" do
        choose "post_state_event_reject"
        click_button "Save"

        post.reload

        expect(post.rejected?).to be_truthy  
      end
    end

    context "when in a approved state" do
      before do
        post.update(state: "approved")
      end

      it "sets the post to a submitted state" do
        choose "post_state_event_submit"
        click_button "Save"

        post.reload

        expect(post.submitted?).to be_truthy  
      end

      it "sets the post to a rejected state" do
        choose "post_state_event_reject"
        click_button "Save"

        post.reload

        expect(post.rejected?).to be_truthy  
      end
    end

    context "when in a rejected state" do
      before do
        post.update(state: "rejected")
      end

      it "sets the post to a submitted state" do
        choose "post_state_event_submit"
        click_button "Save"

        post.reload

        expect(post.submitted?).to be_truthy  
      end

      it "sets the post to a rejected state" do
        choose "post_state_event_accept"
        click_button "Save"

        post.reload

        expect(post.approved?).to be_truthy  
      end
    end
    
  end
end