module LeagueManager
  class Gamesheet < LeagueManager::Base
    attr_reader :goals, :assists, :goalie, :player_id, :yellow, :double_yellow, :red, :name, :team_id, :member_id, :player, :schedule
  end
end