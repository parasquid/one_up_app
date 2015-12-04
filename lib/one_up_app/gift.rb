module OneUpApp
  class Gift
    extend Forwardable
    def_delegators :repository, :given_by, :received_by, :given_by=, :received_by=

    attr_reader :description, :image_url, :message, :date_given

    def initialize(
      description:,
      image_url:,
      message:,
      date_given:
      Time.now,
      repository: GiftRepository.new
    )
      @description = description
      @image_url = image_url
      @message = message
      @date_given = date_given
      @repository = repository
    end

    private

    class GiftRepository
      attr_accessor :given_by, :received_by
      def initialize
        @given_by = []
        @received_by = []
      end
    end

    def repository
      @repository
    end

  end
end