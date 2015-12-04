module OneUpApp
  module Interactors
    class Postman
      def initialize(gift)
        @gift = gift
      end

      def deliver(from:, to:, date: Date.today)
        Array(to).each do |receiver|
          from.give(gift)
          receiver.receive(gift)

          gift.given_by.push(from)
          gift.received_by.push(receiver)
          gift.given_on = date
        end
      end

      private

      def gift
        @gift
      end
    end
  end
end