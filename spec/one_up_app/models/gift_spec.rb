require "spec_helper"
require "one_up_app/models/gift"
require "one_up_app/user"

describe OneUpApp::Models::Gift do
  Given(:gift_options) {
    {
      description: "Lots of love",
      image_url: "hug.png",
      message: "Thanks for listening :)",
      date_given: "2015-11-28"
    }
  }
  subject { OneUpApp::Models::Gift.new(gift_options) }
  Given(:gift_class) { OneUpApp::Models::Gift }

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

  context "gift giving records" do
    Given(:giver) { OneUpApp::User.new(name: "giver") }
    Given(:receiver) { OneUpApp::User.new(name: "receiver") }
    Given(:gift) { gift_class.new(gift_options) }

    context "giving to a receiver" do
      When { giver.give(gift) }
      Then { expect(giver.gifts_given.count).to eq 1 }
      And { expect(giver.gifts_given.first).to eq gift }
    end

    context "receiving a gift" do
      When { receiver.receive(gift) }
      Then { expect(receiver.gifts_received.count).to eq 1 }
      And { expect(receiver.gifts_received.first).to eq gift }
    end

  end

  context "gift management" do
    require "spec_helpers/crud_methods"

    Given(:gift_class) { OneUpApp::Models::Gift.extend(SpecHelpers::CrudMethods) }

    context "creating a gift" do
      When(:gift) { gift_class.create(gift_options) }
      Then { gift.description == gift_options[:description] }
    end

    context "gifts are added to a list of previously created gifts" do
      Given { gift_class.clear_all }
      When(:gift) { gift_class.create(gift_options) }
      Then { gift_class.all.count == 1 }
      And { gift_class.all.first == gift }
    end

    context "clearing the gift list" do
      Given{ gift_class.create(gift_options) }
      When { gift_class.clear_all }
      Then { gift_class.all.empty? }
    end
  end
end
