require 'bundler/setup'
Bundler.setup

#require "codeclimate-test-reporter"
# ENV['CODECLIMATE_REPO_TOKEN'] = "203e7217f95eb57beb64e1c1fd42ac3a379c0f388561387221f0af9799d249f4"
#CodeClimate::TestReporter.start

require 'league_manager'
require 'awesome_print'
require 'vcr'

VCR.configure do |config|
  config.cassette_library_dir = 'spec/cassettes'
  config.hook_into :webmock
  config.configure_rspec_metadata!
  config.ignore_hosts 'codeclimate.com'
end

RSpec.configure do |config|
  # some (optional) config here

end