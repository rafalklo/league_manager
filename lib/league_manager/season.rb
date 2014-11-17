module LeagueManager
  class Season < LeagueManager::Base
    attr_accessor :id, :name, :year, :active, :archived, :leagues

    def self.archived
      get({:method => "archived"})
    end

    def self.show id
      get({:id => id})
    end
  end
end
