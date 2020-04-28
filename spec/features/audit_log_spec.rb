# frozen_string_literal: true

require 'rails_helper'

describe "Audit log" do
  let!(:user) { FactoryBot.create(:employee) }
  let!(:audit_log) { FactoryBot.create(:audit_log, user: user) }
  let!(:admin_user) { FactoryBot.create(:admin_user) }

  describe "index" do
    before do
      login_as(admin_user, scope: :user)
      visit audit_logs_path
    end

    it "has a index page that can be reached" do
      expect(page.status_code).to eql(200)
    end

    it "renders the audit log" do
      expect(page).to have_content(user.full_name)
    end

    it "cannot be accessed by non admin users" do
      logout(:employee)
      login_as(user, scope: :user)

      visit audit_logs_path

      expect(current_path).to eql(root_path)
    end
  end
end
