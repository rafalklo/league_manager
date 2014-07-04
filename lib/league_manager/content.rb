module LeagueManager
  class Content < LeagueManager::Base
    class << self
      def controller_name
        "infos"
      end
    end
  end
end