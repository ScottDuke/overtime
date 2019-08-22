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

  describe "#bootstrap_class_for" do
    it "returns success when flash type is success" do
      expect(self.bootstrap_class_for(:success)).to eq("success")
    end

    it "returns danger when flash type is error" do
      expect(self.bootstrap_class_for(:error)).to eq("danger")
    end

    it "returns warning when flash type is alert" do
      expect(self.bootstrap_class_for(:alert)).to eq("warning")
    end

    it "returns info when flash type is notice" do
      expect(self.bootstrap_class_for(:notice)).to eq("info")
    end

    it "returns info when flash type is notice" do
      expect(self.bootstrap_class_for(:notice)).to eq("info")
    end

    it "returns the flash type if it's not found" do
      expect(self.bootstrap_class_for(:other)).to eq("other")
    end
  end
end
