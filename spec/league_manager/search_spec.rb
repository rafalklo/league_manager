require 'spec_helper'

describe LeagueManager::Search do

  context '.controller_name' do
    it 'returns the name of the remote contoller' do
      object = LeagueManager::Search
      expect(object.controller_name).to eq("searches")
    end
  end

  context '.members', :vcr do

    it 'returns a list of members matching the query' do
      result = LeagueManager::Search.members("raf")
      expect(result.size).to eq(13)
      expect(result.first.lastname).to eq("Aroutiunian")
    end

  end

  context '.teams', :vcr do

    it 'returns a list of teams matching the query' do
      result = LeagueManager::Search.teams("fc")
      expect(result.size).to eq(24)
      expect(result.first.name).to eq("BangBros FC")
    end

  end

end