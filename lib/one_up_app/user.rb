require_dependency "one_up_app/gift"

module OneUpApp
  class User
    class UserRepository
      attr_reader :gifts_given, :gifts_received
      def initialize
        @gifts_given = []
        @gifts_received = []
      end
    end

    attr_reader :name

    def initialize(name:, repository: UserRepository.new)
      @name = name
      @repository = repository
    end

    def give(receiver, gift:)
      receiver.receive(gift)
      gift.given_by = self
      repository.gifts_given << gift
    end

    def receive(gift)
      gift.received_by = self
      repository.gifts_received << gift
    end

    def gifts_received
      repository.gifts_received
    end

    def gifts_given
      repository.gifts_given
    end

    private

    def repository
      @repository
    end

  end
end
