module LeagueManager
  class Standing < LeagueManager::Base
    attr_reader :position, :games, :wins, :ties, :loses, :goals_for, :goals_against, :points, :team, :plus_minus
    attr_reader :players_yellows_count, :players_reds_count, :players_double_yellows_count, :last_five
  end
end