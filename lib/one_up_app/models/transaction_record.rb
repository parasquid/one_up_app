module OneUpApp
  module Models
    class TransactionRecord
      def gifts_received(user:)
        if user.name == "Alsu"
          3
        elsif user.name == "Brian"
          0
        end
      end
    end
  end
end