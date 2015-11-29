require "spec_helper"
require "one_up_app/user"

describe OneUpApp::Gift do
  Given(:gift_options) {
    {
      description: "Lots of love",
      image_url: "hug.png",
      message: "Thanks for listening :)",
      date_given: "2015-11-28"
    }
  }
  subject { OneUpApp::Gift.new(gift_options) }

  context "sanity check" do
    it "can initiate the object" do
      expect(subject).not_to be_nil
    end
  end

  context "gift creation" do
    it "returns the created gift" do
      expect(subject.description).to eq gift_options[:description]
      expect(subject.image_url).to eq gift_options[:image_url]
      expect(subject.message).to eq gift_options[:message]
      expect(subject.date_given).to eq gift_options[:date_given]
    end
  end

  context "gift giving" do
    Given(:giver) { OneUpApp::User.new(name: "giver") }
    Given(:receiver) { OneUpApp::User.new(name: "receiver") }
    Given(:gift) { OneUpApp::Gift.new(gift_options) }

    context "giving to a receiver" do
      When { giver.give(receiver, gift: gift) }
      Then { expect(giver.gifts_given.count).to eq 1 }
      And { expect(giver.gifts_given.first).to eq gift }
    end

    context "receiving a gift" do
      When { receiver.receive(gift) }
      Then { expect(receiver.gifts_received.count).to eq 1 }
      And { expect(receiver.gifts_received.first).to eq gift }
    end

    context "giving to a receiver records that same gift" do
      When { giver.give(receiver, gift: gift) }
      Then { expect(receiver.gifts_received.count).to eq 1 }
      And { expect(receiver.gifts_received.first).to eq gift }
    end

    context "gift knows from whom they were given" do
      When { giver.give(receiver, gift: gift) }
      Then { gift.given_by == giver}
    end

    context "gift knows to whom they were given" do
      When { giver.give(receiver, gift: gift) }
      Then { gift.received_by == receiver}
    end
  end
end