require 'spec_helper'

describe LeagueManager::Season do

  context '.controller_name' do
    it 'returns the name of the remote controller' do
      object = LeagueManager::Season
      expect(object.controller_name).to eq("seasons")
    end
  end

  context '.get', :vcr do

    context '#archived' do
      it 'fetches all archived seasons' do
        result = LeagueManager::Season.archived
        expect(result.first.year).to eq("2013")
        expect(result.size).to eq(3)
        expect(result.last.name).to eq("Summer 2014")
      end
    end

  end

end