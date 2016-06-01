module LeagueManager
  class Schedule < LeagueManager::Base
    attr_accessor :home_team_name, :home_score, :away_team_name, :away_score, :game_defaulted, :game_date, :game_time, :home_id, :away_id, :is_playoffs, :playoffs_category, :played, :field_name
    attr_accessor :gamesheets, :home_team_record, :away_team_record

    attr_accessor :employee_name, :division_name, :league_name, :season_name
    attr_accessor :home_team_players, :away_team_players

    def gamesheets
      @gamesheets || []
    end

    def self.show id
      get({:id => id})
    end
  end
end