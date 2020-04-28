# frozen_string_literal: true

require 'rails_helper'

describe "Homepage" do
  context "when logged in as a admin" do
    let!(:user) { FactoryBot.create(:user) }
    let!(:post) { FactoryBot.create(:post, user: user) }
    let!(:admin_user) { FactoryBot.create(:admin_user) }

    before do
      login_as(admin_user, scope: :user)
      visit root_path
    end

    it "allows the admin to approve the post from the homepage" do
      click_on("approve-#{post.id}")

      post.reload

      expect(post.state).to eql("approved")
    end
  end

  context "when logged in as a user" do
    let!(:user) { FactoryBot.create(:employee) }
    let!(:audit_log) { FactoryBot.create(:audit_log, user: user, state: "pending") }

    before do
      login_as(user, scope: :user)
      visit root_path
    end

    it "allows the user to change the audit log status from the homepage" do
      click_on("confirm-#{audit_log.id}")

      audit_log.reload

      expect(audit_log.state).to eql("confirmed")
    end
  end
end
