require 'rails_helper'

RSpec.describe User, type: :model do
  describe "creation" do
    before do
      @user = User.create(email: "test@test.com", password: "password", password_confirmation: "password", first_name: "test", last_name: "testy")
    end

    it "creates a user" do
      expect(@user).to be_valid  
    end

    context "is not valid when" do
      it "first_name is empty" do
        @user.first_name = nil
        expect(@user).to_not be_valid
      end

       it "last_name is empty" do
        @user.last_name = nil
        expect(@user).to_not be_valid
      end
    end
    
  end
end
