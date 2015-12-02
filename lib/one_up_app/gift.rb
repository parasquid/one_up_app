require_dependency "one_up_app/contexts/crud"

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

    def to_s(formatter: StringFormatter)
      formatter.format(self)
    end

    private

    class GiftRepository
      attr_accessor :given_by, :received_by
    end

    def repository
      @repository
    end

    class StringFormatter
      def self.format(gift)
        response = <<-EOL.gsub(/^\s+/, '')
          #{gift.given_by.name} gave #{gift.received_by.name} #{gift.description} on #{gift.date_given}.
          #{gift.message}
        EOL
      end
    end

  end
end