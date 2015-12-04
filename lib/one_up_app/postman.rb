module OneUpApp
  class Postman
    def initialize(package)
      @package = package
    end

    def deliver(from:, to:)
      Array(to).each do |receiver|
        from.give(package)
        receiver.receive(package)
        package.given_by = from
        package.received_by = receiver
      end
    end

    private

    def package
      @package
    end
  end
end