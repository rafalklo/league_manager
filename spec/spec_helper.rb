require 'bundler/setup'
Bundler.setup

require 'league_manager' # and any other gems you need
require 'awesome_print'
require 'vcr'

require "codeclimate-test-reporter"
CodeClimate::TestReporter.start

VCR.configure do |c|
  c.cassette_library_dir = 'spec/cassettes'
  c.hook_into :webmock
  c.configure_rspec_metadata!
end

RSpec.configure do |config|
  # some (optional) config here

end