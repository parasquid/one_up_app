module OneUpApp
  module Interactors
    class Postman
      def initialize(gift)
        @gift = gift
      end

      def deliver(from:, to:, date: Date.today)
        Array(to).each do |receiver|
          transfer(from, receiver)
          update_gift_records(from, receiver, date)
        end
      end

      private

      def transfer(from, to)
        from.give(gift)
        to.receive(gift)
      end

      def update_gift_records(from, to, date)
        gift.given_by.push(from)
        gift.received_by.push(to)
        gift.given_on = date
      end

      def gift
        @gift
      end
    end
  end
end