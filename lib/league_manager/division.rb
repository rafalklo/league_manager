module LeagueManager
  class Division < LeagueManager::Base
    attr_reader :active, :schedule_updated_at, :league

    def self.top_goalkeepers( id, limit = 10 )
      get({:method => "top_goalkeepers", :id => id, :limit => limit})
    end

    def self.goalie_most_shutouts( id, limit = 10 )
      get({:method => "goalie_most_shutouts", :id => id, :limit => limit})
    end

  end
end