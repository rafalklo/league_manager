module LeagueManager
  class Team < LeagueManager::Base
    attr_reader :color, :division_name, :league_name, :season_name, :active, :division
    attr_reader :players
  end
end