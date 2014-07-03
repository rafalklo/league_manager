require 'spec_helper'

describe LeagueManager::Division do

  context '.controller_name' do
    it 'returns the name of the remote contoller' do
      object = LeagueManager::Division
      expect(object.controller_name).to eq("divisions")
    end
  end

  context '.get', :vcr do

    context '#top_goalscorers' do
      it 'returns the list of top goalscorers for a given division' do
        result = LeagueManager::Division.get({:method => "top_goalscorers", :id => "1"})
        expect(result.first.member.name).to eq("Lopez, Hernan")
      end
    end

    context '#standings' do
      it 'returns the standings for a given division' do
        result = LeagueManager::Division.get({:method => "standings", :id => "1"})
        expect(result.last.team.name).to eq("UTX Soccer")
      end
    end

    # context '#index' do
    #   it 'returns the list of active divisions' do
    #     result = LeagueManager::Division.get()
    #     ap result
    #     expect(result.last.team.name).to eq("UTX Soccer")
    #   end
    # end

    context '#recent_results' do
      it 'returns the recent results of a given division' do
        result = LeagueManager::Division.get({:method => "recent_results", :id => "1"})
        expect(result.last.away_team_name).to eq("UTX Soccer")
      end
    end

  end

end