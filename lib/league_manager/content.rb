module LeagueManager
  class Content < LeagueManager::Base
    attr_reader :title_en, :active, :en, :fr, :title_fr
    class << self
      def controller_name
        "infos"
      end
    end
  end
end