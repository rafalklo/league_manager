module LeagueManager
  class Standing < LeagueManager::Base
    attr_reader :position, :games, :wins, :ties, :loses, :goals_for, :goals_against, :points, :team
  end
end