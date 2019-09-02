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
      expect(active?(root_path)).to eq("active")
    end

    it "returns nil when on the current page" do
      allow(self).to receive(:current_page?).and_return(false)
      expect(active?(root_path)).to be_nil
    end
  end

  describe "#sr_only_span" do
    it "retunrs the sr-only span when on current page" do
      allow(self).to receive(:current_page?).and_return(true)
      expect(sr_only_span(root_path)).to eq("<span class='sr-only'>(current)</span>")
    end

    it "retunrs the sr-only span when on current page" do
      allow(self).to receive(:current_page?).and_return(false)
      expect(sr_only_span(root_path)).to be_nil
    end
  end

  describe "#bootstrap_class_for" do
    it "returns colour gradient for success when flash type is success" do
      expected_class = "linear-gradient(to right, rgba(157,213,58,1) 0%,rgba(161,213,79,1) 50%,rgba(124,188,10,1) 100%)"
      expect(bootstrap_class_for(:success)).to eq(expected_class)
    end

    it "returns colour gradient for error when flash type is error" do
      expected_class = "linear-gradient(to right, rgba(247,100,74,1) 0%,rgba(231,56,39,1) 100%)"
      expect(bootstrap_class_for(:error)).to eq(expected_class)
    end

    it "returns colour gradient for alert when flash type is alert" do
      expected_class = "linear-gradient(to right, rgba(252,236,88,1) 0%,rgba(241,218,54,1) 100%)"
      expect(bootstrap_class_for(:alert)).to eq(expected_class)
    end

    it "returns colour gradient for notice when flash type is notice" do
      expected_class = "linear-gradient(to right, rgba(41,137,216,1) 0%,rgba(30,87,153,1) 100%)"
      expect(bootstrap_class_for(:notice)).to eq(expected_class)
    end

    it "returns default colour gradient when it's not found" do
      expected_class = "linear-gradient(to right, rgba(135,224,253,1) 0%,rgba(83,203,241,1) 40%,rgba(5,171,224,1) 100%)"
      expect(bootstrap_class_for(:other)).to eq(expected_class)
    end
  end
end
