require "spec_helper"
require "one_up_app/gift"

describe OneUpApp::Gift do
  let(:options) {
    {
      description: "Lots of love",
      image_url: "hug.png",
      message: "Thanks for listening :)",
      giver: "Alsu",
      receiver: "Derek",
      date_given: "2015-11-28"
    }
  }
  subject { OneUpApp::Gift.new(options) }

  context "sanity check" do
    it "can initiate the object" do
      expect(subject).not_to be_nil
    end
  end

  context "gift creation" do
    it "returns the created gift" do
      expect(subject.description).to eq options[:description]
      expect(subject.image_url).to eq options[:image_url]
      expect(subject.message).to eq options[:message]
      expect(subject.giver).to eq options[:giver]
      expect(subject.receiver).to eq options[:receiver]
      expect(subject.date_given).to eq options[:date_given]
    end
  end
end