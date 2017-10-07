# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'league_manager/version'

Gem::Specification.new do |spec|
  spec.name          = "league_manager"
  spec.version       = LeagueManager::VERSION
  spec.authors       = ["Rafal Klodzinski", "UTX Web Inc."]
  spec.email         = ["rafal@utxsolutions.com"]
  spec.summary       = %q{Wrapper gem for the UTX League Manager API.}
  spec.description   = %q{Wrapper gem for the UTX League Manager API.}
  spec.homepage      = "http://www.utxsolutions.com/utx_league_manager"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "vcr"
  spec.add_development_dependency "webmock"
  spec.add_development_dependency "awesome_print"
  spec.add_development_dependency "codeclimate-test-reporter"

  spec.add_dependency "rest-client"
  spec.add_dependency "oj"
  spec.add_dependency "activesupport"
end
