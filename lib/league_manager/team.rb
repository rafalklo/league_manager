module LeagueManager
  class Team < LeagueManager::Base
    attr_reader :color
    attr_reader :players
  end
end