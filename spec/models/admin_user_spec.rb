require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { FactoryBot.create(:admin_user) }

  describe "#full_name" do
    it "returns the full name of the user" do
      expect(user.full_name).to eql("Test Admin".titleize)
    end
  end

  describe "#admin?" do
    it "returns false for user" do
      expect(user.admin?).to be_truthy
    end
  end
end
