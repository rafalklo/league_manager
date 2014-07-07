require 'spec_helper'

describe LeagueManager::Schedule do

  context '#gamesheets' do
    it 'returns an empty array when not set' do
      schedule = LeagueManager::Schedule.new({:game_date => Date.today})
      expect(schedule.gamesheets.first).to eq(nil)
    end

    it 'returns an array of LeagueManager::Gamesheet' do
      schedule = LeagueManager::Schedule.new({:gamesheets => [{:gamesheet => {"key" => "value"}}]})
      expect(schedule.gamesheets.first.key).to eq("value")
    end
  end

end