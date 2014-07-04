require 'spec_helper'

describe LeagueManager::Content do

  context '.controller_name' do
    it 'returns the name of the remote contoller' do
      object = LeagueManager::Content
      expect(object.controller_name).to eq("infos")
    end
  end

  context '.get', :vcr do

    context '#index' do
      it 'fetches all active contents' do
        result = LeagueManager::Content.get
        expect(result.first.title_en).to eq("Beginning of season")
      end
    end

  end
end