require 'spec_helper'

describe LeagueManager::League do

  context '.controller_name' do
    it 'returns the name of the remote contoller' do
      object = LeagueManager::League
      expect(object.controller_name).to eq("leagues")
    end
  end

  context '.get', :vcr do

    context '#index' do
      it 'fetches all active leagues' do
        result = LeagueManager::League.get()
        expect(result.first.name).to eq("Monday")
      end
    end

  end
end