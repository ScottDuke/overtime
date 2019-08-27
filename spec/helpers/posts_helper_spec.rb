require 'rails_helper'

# Specs in this file have access to a helper object that includes
# the PostsHelper. For example:
#
# describe PostsHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       expect(helper.concat_strings("this","that")).to eq("this that")
#     end
#   end
# end
RSpec.describe PostsHelper, type: :helper do

  describe "#state_badge" do
    it "returns a primary badge when state is submitted" do
      expect(self.state_badge("submitted")).to eq("<span class=\"badge badge-primary\">Submitted</span>")
    end

    it "returns a danger badge when state is rejected" do
      expect(self.state_badge("rejected")).to eq("<span class=\"badge badge-danger\">Rejected</span>")
    end

    it "returns a success badge when state is approved" do
      expect(self.state_badge("approved")).to eq("<span class=\"badge badge-success\">Approved</span>")
    end
  end
end
