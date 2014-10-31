module LeagueManager
  class Player < LeagueManager::Base
    attr_reader :member, :team, :goals, :yellows, :double_yellows, :reds, :mvp_awards, :games
  end
end