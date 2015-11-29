module OneUpApp
  class Gift
    attr_reader :description, :image_url, :message, :date_given
    attr_accessor :given_by, :received_by

    @@list = []

    def self.create(args)
      @@list << (element = self.new(args))
      element
    end

    def self.all
      @@list
    end

    def self.clear_all
      @@list = []
    end

    def initialize(description:, image_url:, message:, date_given: Time.now)
      @description = description
      @image_url = image_url
      @message = message
      @date_given = date_given
    end

    def to_s(formatter: StringFormatter)
      formatter.format(self)
    end

    private

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