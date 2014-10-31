module LeagueManager
  class League < LeagueManager::Base
    attr_reader :active, :divisions
  end
end