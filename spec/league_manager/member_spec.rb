require 'spec_helper'

describe LeagueManager::Member do

  context '.controller_name' do
    it 'returns the name of the remote contoller' do
      object = LeagueManager::Member
      expect(object.controller_name).to eq("members")
    end
  end

  context '.get', :vcr do

    context '#index' do
      it 'fetches all active mvp players' do
        result = LeagueManager::Member.get({:method => :mvp})
        expect(result.size).to eq(15)
        expect(result.first.player.member.name).to eq("Boyer, Christophe")
      end

    end

    context  '#search' do
      it 'searches for a member by first and last name' do
        result = LeagueManager::Member.get({:method => :search, :q => "rafal"})
        expect(result.first.firstname).to eq("Rafal")
        expect(result.first.lastname).to eq("Klodzinski")
      end
    end

  end
end