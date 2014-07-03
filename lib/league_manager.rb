require 'rest-client'
require 'oj'
require 'active_support/inflector'

require 'league_manager/version'
require 'league_manager/configuration'
require 'league_manager/client'
require 'league_manager/result_set'

require 'league_manager/base'
require 'league_manager/division'
require 'league_manager/member'
require 'league_manager/player'
require 'league_manager/schedule'
require 'league_manager/standing'
require 'league_manager/suspension'
require 'league_manager/team'

module LeagueManager
  extend Configuration
end
