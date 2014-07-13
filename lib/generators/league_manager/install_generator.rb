require 'rails/generators/base'

module LeagueManager
  module Generators
    class InstallGenerator < Rails::Generators::Base
      source_root File.expand_path("../../templates", __FILE__)

      desc "Creates a League Manager initializer and copy locale files to your application."
      class_option :orm

      def copy_initializer
        template "league_manager.rb", "config/initializers/league_manager.rb"
      end

    end
  end
end