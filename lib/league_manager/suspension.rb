module LeagueManager
  class Suspension < LeagueManager::Base
    attr_reader :games, :offense, :under_review, :manual_return_date, :return_date, :return_game, :member, :player
  end
end