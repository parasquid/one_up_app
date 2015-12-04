require "spec_helper"
require "one_up_app/user"
require "one_up_app/gift"
require "one_up_app/postman"

describe OneUpApp::Postman do
  context "sanity check" do
    Given(:gift) { double("gift") }
    Given(:postman) { OneUpApp::Postman }
    When(:instance) { postman.new(gift) }
    Then { instance != nil }
  end

  Given(:gift_options) {
    {
      description: "Lots of love",
      image_url: "hug.png",
      message: "Thanks for listening :)",
      date_given: "2015-11-28"
    }
  }
  Given(:gift) { OneUpApp::Gift.new(gift_options) }
  Given(:giver) { OneUpApp::User.new(name: "giver") }
  Given(:receiver) { OneUpApp::User.new(name: "receiver") }
  Given(:postman) { OneUpApp::Postman.new(gift)}
  context "giving a gift to a receiver" do
    When { postman.deliver(from: giver, to: receiver) }

    context "giving to a receiver records that same gift" do
      Then { expect(receiver.gifts_received.count).to eq 1 }
      Then { expect(receiver.gifts_received.first).to eq gift }
      Then { expect(giver.gifts_given.count).to eq 1 }
      Then { expect(giver.gifts_given.first).to eq gift }
    end

    context "gift behaviors" do
      context "gift knows from whom they were given" do
        Then { gift.given_by == giver}
      end

      context "gift knows to whom they were given" do
        Then { gift.received_by == receiver}
      end

      context "gift knows how to present itself" do
        Then { gift.to_s == "giver gave receiver Lots of love on 2015-11-28.\nThanks for listening :)\n" }
      end
    end
  end

  context "giving a gift to multiple receivers" do
    Given(:receiver_2) { OneUpApp::User.new(name: "receiver") }
    Given(:receivers) { [receiver, receiver_2] }
    When { postman.deliver(from: giver, to: receivers)}
    Then { receiver.gifts_received.count == 1 }
    Then { receiver_2.gifts_received.count == 1 }
    Then { giver.gifts_given.count == 2 }
  end
end