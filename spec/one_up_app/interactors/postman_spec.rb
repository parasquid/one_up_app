require "spec_helper"
require "one_up_app/user"
require "one_up_app/models/gift"
require "one_up_app/interactors/postman"

describe OneUpApp::Interactors::Postman do
  context "sanity check" do
    Given(:gift) { double("gift") }
    Given(:postman) { OneUpApp::Interactors::Postman }
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
  Given(:gift_class) { OneUpApp::Models::Gift }
  Given(:gift) { gift_class.new(gift_options) }
  Given(:giver) { OneUpApp::User.new(name: "giver") }
  Given(:receiver) { OneUpApp::User.new(name: "receiver") }
  Given(:postman) { OneUpApp::Interactors::Postman.new(gift)}
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
        Then { gift.given_by.first == giver}
      end

      context "gift knows to whom they were given" do
        Then { gift.received_by.first == receiver}
      end

      context "gift knows when it was given" do
        Then { gift.given_on == Date.today }
      end
    end
  end

  context "giving a gift to multiple receivers" do
    Given(:receiver_2) { OneUpApp::User.new(name: "receiver 2") }
    Given(:receivers) { [receiver, receiver_2] }
    When { postman.deliver(from: giver, to: receivers)}
    Then { receiver.gifts_received.count == 1 }
    Then { receiver_2.gifts_received.count == 1 }
    Then { giver.gifts_given.count == 2 }
  end

end
