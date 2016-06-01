module LeagueManager
  class Player < LeagueManager::Base
    attr_reader :member, :team, :goals, :yellows, :double_yellows, :reds, :mvp_awards, :games, :assists, :points
    # Goalie season stats
    attr_reader :goalie_goals_against, :goalie_games, :goalie_goals_against_average, :goalie_shutouts
    attr_reader :coach, :is_suspended
  end
end