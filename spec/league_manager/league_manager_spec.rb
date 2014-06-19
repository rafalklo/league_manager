require 'spec_helper'

describe LeagueManager do
  it 'should have a version' do
    expect(LeagueManager::VERSION).not_to be_empty
  end
end