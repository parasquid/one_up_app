require_dependency "one_up_app/gift"

module OneUpApp
  class User
    attr_reader :gifts_given, :gifts_received, :name

    include OneUpApp::Contexts::Crud

    def initialize(name:)
      @gifts_given = []
      @gifts_received = []
      @name = name
    end

    def give(receiver, gift:)
      receiver.receive(gift)
      gift.given_by = self
      @gifts_given << gift
    end

    def receive(gift)
      gift.received_by = self
      @gifts_received << gift
    end

  end
end
