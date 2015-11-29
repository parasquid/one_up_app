module OneUpApp
  class Gift
    attr_reader :description, :image_url, :message, :giver, :receiver, :date_given
    def initialize(description:, image_url:, message:, giver:, receiver:, date_given:)
      @description = description
      @image_url = image_url
      @message = message
      @giver = giver
      @receiver = receiver
      @date_given = date_given
    end
  end
end