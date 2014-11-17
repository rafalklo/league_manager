module LeagueManager
  class Content < LeagueManager::Base
    attr_reader :title_en, :active, :en, :fr, :title_fr, :created_at
    class << self
      def controller_name
        "infos"
      end
    end

    def published_at
      self.created_at
    end

  end
end