require "spec_helper"
require "one_up_app/user"

describe OneUpApp::User do
  subject { OneUpApp::User.new }
  context "sanity check" do
    it "can be instantiated" do
      expect(subject).not_to be_nil
    end
  end

  context "gift giving" do
    Given(:giver) { OneUpApp::Giver.new }
    Given(:receiver) { OneUpApp::Receiver.new }
    Given(:gift_options) {
      {
        description: "Lots of love",
        image_url: "hug.png",
        message: "Thanks for listening :)",
        giver: "Alsu",
        receiver: "Derek",
        date_given: "2015-11-28"
      }
    }
    Given(:gift) { OneUpApp::Gift.new(gift_options) }

    When { giver.give(receiver, gift: gift) }

    Then { expect(giver.gifts_given.count).to eq 1 }
    And { expect(receiver.gifts_received.count).to eq 1 }
  end
end