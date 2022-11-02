module LeagueManager
  class Member < LeagueManager::Base
    attr_reader :firstname, :lastname, :players, :created_at, :name
    attr_reader :picture_path, :is_blacklisted

    def self.show id
      get({:id => id})
    end
  end
end
