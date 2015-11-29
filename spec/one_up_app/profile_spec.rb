require "spec_helper"
require "one_up_app/profile.rb"

describe OneUpApp::Profile do
  subject { OneUpApp::Profile.new }

  context "sanity check" do
    it "can initiate the object" do
      expect(subject).not_to be_nil
    end
  end

  context "gift listing" do
    it "returns a list of gifts received" do
      expect(subject.gifts_received).not_to be nil
      expect(subject.gifts_received).to respond_to(:each)
    end
  end
end