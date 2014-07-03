module LeagueManager

  class ResultSet

    def self.from_json(json)
      parsed = Oj.load( json )
      parse_hash( parsed )
    end

    def self.parse_hash data
      key = data.keys.first
      klass = data[key].class
      if klass == Array
        @results = []
        data[key].each do |data|
          key = data.keys.first
          @results << parse_object( data, key )
        end
        @results
      elsif klass == Hash
        parse_object( data, key )
      else
        puts "#{klass}".green
      end
    end

    def self.parse_object data, key
      eval("LeagueManager::#{key.capitalize}").class.module_eval { attr_accessor key.to_sym }
      eval("LeagueManager::#{key.capitalize}").new(data[key])
    end

  end
end