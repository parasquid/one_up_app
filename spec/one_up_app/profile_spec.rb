require "spec_helper"
require "one_up_app/profile.rb"

describe OneUpApp::Profile do
  context "sanity check" do
    subject { OneUpApp::Profile.new }
    it "can initiate the object" do
      expect(subject).not_to be_nil
    end
  end
end