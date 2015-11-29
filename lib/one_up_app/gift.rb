module OneUpApp
  class Gift
    attr_reader :description, :image_url, :message, :date_given
    attr_accessor :given_by, :received_by

    def initialize(description:, image_url:, message:, date_given: Time.now)
      @description = description
      @image_url = image_url
      @message = message
      @date_given = date_given
    end

  end
end