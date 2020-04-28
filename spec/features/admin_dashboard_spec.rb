# frozen_string_literal: true

require 'rails_helper'

describe "admin dashboard" do
  it "it redirects when user is not logged in as admin" do
    visit admin_root_path
    expect(current_path).to eql(new_user_session_path)
  end

  it "cannot be reached by a non admin user" do
    user = FactoryBot.create(:employee)
    login_as(user, scope: :user)

    visit admin_root_path

    expect(current_path).to eq(root_path)
  end

  it "cannot be reached by a admin user" do
    admin_user = FactoryBot.create(:admin_user)
    login_as(admin_user, scope: :user)

    visit admin_root_path

    expect(current_path).to eq(admin_root_path)
  end
end
