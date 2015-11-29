module OneUpApp
  class Gift
    attr_reader :description, :image_url, :message, :date_given
    attr_accessor :given_by, :received_by

    @@gifts = []

    def self.create(gift_options)
      @@gifts << (gift = self.new(gift_options))
      gift
    end

    def self.all
      @@gifts
    end

    def self.clear_all
      @@gifts = []
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