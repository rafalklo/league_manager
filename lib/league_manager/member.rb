module LeagueManager
  class Member < LeagueManager::Base
    attr_reader :firstname, :lastname, :players, :created_at, :name

    def self.show id
      get({:id => id})
    end
  end
end
