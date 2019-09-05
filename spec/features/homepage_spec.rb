# frozen_string_literal: true

require 'rails_helper'

describe "Homepage" do
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
