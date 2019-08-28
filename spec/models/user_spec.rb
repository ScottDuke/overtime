require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { FactoryBot.create(:user) }

  describe "creation" do
    it "creates a user" do
      expect(user).to be_valid  
    end

    context "is not valid when" do
      it "first_name is empty" do
        user.first_name = nil
        expect(user).to_not be_valid
      end

       it "last_name is empty" do
        user.last_name = nil
        expect(user).to_not be_valid
      end

      it "phone_number is empty" do
        user.phone_number = nil
        expect(user).to_not be_valid
      end
    end
    
  end

  describe "#full_name" do
    it "returns the full name of the user" do
      expect(user.full_name).to eql("test testy".titleize)
    end
  end

  describe "#is_admin?" do
    it "returns false for user" do
      expect(user.is_admin?).to be_falsey
    end
  end
end
