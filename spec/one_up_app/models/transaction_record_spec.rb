require "spec_helper"
require "one_up_app/models/transaction_record"

describe OneUpApp::Models::TransactionRecord do
  context "sanity check" do
    Given(:t_record) { OneUpApp::Models::TransactionRecord }
    When(:instance) { t_record.new }
    Then { instance != nil }
  end

  Given(:user_alsu) { double("user", name: "Alsu") }
  Given(:user_brian) { double("user", name: "Brian") }
  context "user statisticts" do
    Given(:t_record) { OneUpApp::Models::TransactionRecord }
    Given(:instance) { t_record.new }
    
    context "gifts have been received" do
      When(:gifts_received) { instance.gifts_received(user: user_alsu) }
      Then { gifts_received == 3 }
    end

    context "no gifts received" do
      When(:gifts_received) { instance.gifts_received(user: user_brian) }
      Then { gifts_received == 0 }
    end
  end
end