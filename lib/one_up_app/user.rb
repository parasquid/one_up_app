require_dependency "one_up_app/gift"

module OneUpApp
  class User
    extend Forwardable
    def_delegators :repository, :gifts_received, :gifts_given

    attr_reader :name

    def initialize(name:, repository: UserRepository.new)
      @name = name
      @repository = repository
    end

    def give(gift)
      repository.gifts_given << gift
    end

    def receive(gift)
      gift.received_by = self
      repository.gifts_received << gift
    end

    private

    def repository
      @repository
    end

    class UserRepository
      attr_reader :gifts_given, :gifts_received
      def initialize
        @gifts_given = []
        @gifts_received = []
      end
    end

  end
end
