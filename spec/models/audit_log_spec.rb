# frozen_string_literal: true

require 'rails_helper'

RSpec.describe AuditLog, type: :model do
  let!(:user) { FactoryBot.create(:user) }
  let!(:audit_log) { FactoryBot.create(:audit_log, user: user) }

  describe "creation" do
    it "creates a aduit log" do
      expect(audit_log).to be_valid
    end

    context "is not valid when" do
      it "user is not present" do
        audit_log.user = nil
        expect(audit_log).to_not be_valid
      end
    end

    it "has a start date of 6 days ago" do
      expect(audit_log.start_date).to eql(Date.today - 6.days)
    end
  end
end
