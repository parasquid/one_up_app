module OneUpApp
  class Postman
    def initialize(package)
      @package = package
    end

    def deliver(from:, to:)
      from.give(package)
      to.receive(package)
      package.given_by = from
      package.received_by = to
    end

    private

    def package
      @package
    end
  end
end