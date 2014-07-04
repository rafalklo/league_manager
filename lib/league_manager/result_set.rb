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
        results = []
        data[key].each do |data|
          key = data.keys.first
          results << parse_object( data, key )
        end
        results
      elsif klass == Hash
        parse_object( data, key )
      else
        puts "#{klass}".green
      end
    end

    def self.parse_object data, key
      mapping = {"info" => "content"}
      object_name = key
      object_name = mapping[key] if mapping.include? key
      eval("LeagueManager::#{object_name.capitalize}").class.module_eval { attr_accessor object_name.to_sym }
      eval("LeagueManager::#{object_name.capitalize}").new(data[key])
    end

  end
end