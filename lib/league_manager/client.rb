module LeagueManager

  class Client

    # Define the same set of accessors as the LeagueManager module
    attr_accessor *Configuration::VALID_CONFIG_KEYS

    def initialize(options={})
      # Merge the config values from the module and those passed
      # to the client.
      merged_options = LeagueManager.options.merge(options)

      # Copy the merged values to this client and ignore those
      # not part of our configuration
      Configuration::VALID_CONFIG_KEYS.each do |key|
        send("#{key}=", merged_options[key])
      end
    end

    def get(options = {})
      result = nil
      begin
        json  = RestClient.get(build_query_string(options), build_query_params(options[:params]))
        ap json
        result = ResultSet.from_json( json )
      rescue NameError => e
        puts "NameError".green
        puts "#{e}"
      rescue Exception => e
        puts "Exception".green
        puts "#{e}"
      end
      result
    end

    def build_query_string options = {}
      "http://#{self.endpoint}/api/#{options[:resource]}"
    end

    def build_query_params params
      params = {} unless params
      {:params => params.merge({:api_key => self.api_key}), :accept => self.format}
    end
  end # Client

end