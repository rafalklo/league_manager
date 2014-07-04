module LeagueManager
  class Base
    attr_accessor :base_object

    class << self
      def get options = {}
        client = LeagueManager::Client.new(:endpoint => "127.0.0.1:3001", :api_key => "dev")
        url = [options[:id], options[:method]].compact.join("/")
        options.except!(:method, :id)
        request_options = {:resource => "#{controller_name}/#{url}", :params => options}
        result = client.get( request_options )
      end

      def controller_name
        self.name.underscore.pluralize.gsub("league_manager/", "")
      end
    end

    def initialize attrs = {}
      @base_object = attrs
      # Dynamically creating attributes for each LeagueManager::Object
      attrs.each_pair do |k, v|
        self.singleton_class.send(:attr_accessor, k)
        if v.class == Array
          # Relation has_many
          #   eg. {:players => [{:player => {:id => 587}}]}
          send("#{k}=", LeagueManager::ResultSet.parse_hash( {k => v} ) )
        elsif v.class == Hash
          # Relation has_one 
          #   eg.{:member => {:name => "Rafal Klodzinksi"}}
          send("#{k}=", LeagueManager::ResultSet.parse_hash( {k => v} ) )
        else
          # Simple attribute (:id, :name)
          #   eg. {:name => "Rafal Klodzinski"}
          send("#{k}=", v)
        end
      end
    end

    def to_s
      @base_object
    end

  end
end