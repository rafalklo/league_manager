module LeagueManager
  class Division < LeagueManager::Base
    attr_reader :active, :schedule_updated_at, :league

    def self.top_goalkeepers( id, limit = 10 )
      get({:method => "top_goalkeepers", :id => id, :limit => limit})
    end

    def self.goalie_most_shutouts( id, limit = 10 )
      get({:method => "goalie_most_shutouts", :id => id, :limit => limit})
    end

    def self.most_goals( id, limit = 10 )
      get({:method => "most_goals", :id => id, :limit => limit})
    end

    def self.most_assists( id, limit = 10 )
      get({:method => "most_assists", :id => id, :limit => limit})
    end

    def self.most_points( id, limit = 10 )
      get({:method => "most_points", :id => id, :limit => limit})
    end

  end
end