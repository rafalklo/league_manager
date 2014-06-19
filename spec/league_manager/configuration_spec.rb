require 'spec_helper'

describe LeagueManager::Configuration do

  LeagueManager::Configuration::VALID_CONFIG_KEYS.each do |key|
    describe ".#{key}" do
      it 'should return the default value' do
        expect(LeagueManager.send(key)).to eq( LeagueManager::Configuration.const_get("DEFAULT_#{key.upcase}") )
      end
    end
  end

  after do
    LeagueManager.reset
  end
 
  describe '.configure' do
    LeagueManager::Configuration::VALID_CONFIG_KEYS.each do |key|
      it "should set the #{key}" do
        LeagueManager.configure do |config|
          config.send("#{key}=", key)
          expect(LeagueManager.send(key)).to eq( key )
        end
      end
    end
  end

end