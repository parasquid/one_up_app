require "spec_helper"
require "one_up_app/user"

describe OneUpApp::User do
  subject { OneUpApp::User.new(name: "user") }
  context "sanity check" do
    it "can be instantiated" do
      expect(subject).not_to be_nil
    end

    it "cannot be instantiated without a name" do
      expect {OneUpApp::User.new}.to raise_error(ArgumentError)
    end
  end

  Given(:giver) { OneUpApp::User.new(name: "giver") }
  Given(:receiver) { OneUpApp::User.new(name: "receiver") }

  context "initial state" do
    context "gifts given" do
      When(:gifts_given) { giver.gifts_given }
      Then { expect(gifts_given.count).to eq 0 }
    end
    context "gifts received" do
      When(:gifts_received) { giver.gifts_received }
      Then { expect(gifts_received.count).to eq 0 }
    end
  end

  context "user management" do
    Given(:user_class) { OneUpApp::User }

    context "creating a user" do
      When(:user) { user_class.create(name: "user") }
      Then { user.name == "user" }
    end

    context "users are added to a list of previously created users" do
      Given { user_class.clear_all }
      When(:user) { user_class.create(name: "user") }
      Then { user_class.all.count == 1 }
      And { user_class.all.first == user }
    end

    context "clearing the user list" do
      Given{ user_class.create(name: "user") }
      When { user_class.clear_all }
      Then { user_class.all.empty? }
    end
  end

end