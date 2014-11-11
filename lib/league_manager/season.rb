module LeagueManager
  class Season < LeagueManager::Base
    attr_accessor :id, :name, :year, :active, :archived

    def self.archived
      get({:method => "archived"})
    end
  end
end
