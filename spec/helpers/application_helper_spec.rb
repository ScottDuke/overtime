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
RSpec.describe ApplicationHelper, type: :helper do
  describe "#active?" do
    it "returns active when on the current page" do
      allow(self).to receive(:current_page?).and_return(true)
      expect(self.active?(root_path)).to eq("active")
    end

    it "returns nil when on the current page" do
      allow(self).to receive(:current_page?).and_return(false)
      expect(self.active?(root_path)).to be_nil
    end
  end

  describe "#sr_only_span" do
    it "retunrs the sr-only span when on current page" do
      allow(self).to receive(:current_page?).and_return(true)
      expect(self.sr_only_span(root_path)).to eq("<span class='sr-only'>(current)</span>")
    end

    it "retunrs the sr-only span when on current page" do
      allow(self).to receive(:current_page?).and_return(false)
      expect(self.sr_only_span(root_path)).to be_nil
    end
  end
end
