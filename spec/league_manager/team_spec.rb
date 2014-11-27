require 'spec_helper'

describe LeagueManager::Team do

  context '.controller_name' do
    it 'returns the name of the remote contoller' do
      object = LeagueManager::Team
      expect(object.controller_name).to eq("teams")
    end
  end

  context '.get', :vcr do

    context '#index' do
      it 'fetches all active teams' do
        result = LeagueManager::Team.get
        expect(result.first.name).to eq("McKibbins")
      end
    end

    context '#schedules' do
      it 'fetches the full schedule of a team' do
        result = LeagueManager::Team.get({:method => :schedules, :id => 32})
        expect(result.first.away_team_name).to eq("McKibbins")
      end
    end

    context '#show' do
      it 'fetches the team information' do
        result = LeagueManager::Team.get({:id => 32})
        expect(result.players.size).to eq(18)
        expect(result.standing.position).to eq(5)
      end
    end

  end
end