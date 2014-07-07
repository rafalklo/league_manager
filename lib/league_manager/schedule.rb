module LeagueManager
  class Schedule < LeagueManager::Base
    attr_accessor :gamesheets
    def gamesheets
      @gamesheets || []
    end
  end
end