module OneUpApp
  module Interactors
    class Postman
      def initialize(gift)
        @gift = gift
      end

      def deliver(from:, to:)
        Array(to).each do |receiver|
          from.give(gift)
          receiver.receive(gift)

          gift.given_by.push(from)
          gift.received_by.push(receiver)
        end
      end

      private

      def gift
        @gift
      end
    end
  end
end