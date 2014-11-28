module LeagueManager
  class Search < LeagueManager::Base
    def self.members q
      get({:method=> "members", :q => q})
    end

    def self.teams q
      get({:method=> "teams", :q => q})
    end
  end
end