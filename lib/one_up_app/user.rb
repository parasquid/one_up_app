require_dependency "one_up_app/gift"

module OneUpApp
  class User
    def give(receiver, gift:)
    end

    def gifts_given
      [""]
    end

    def gifts_received
      [""]
    end
  end
end

require_dependency "one_up_app/giver"
require_dependency "one_up_app/receiver"
