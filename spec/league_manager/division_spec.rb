require 'spec_helper'

describe LeagueManager::Division do

  context '.controller_name' do
    it 'returns the name of the remote contoller' do
      object = LeagueManager::Division
      expect(object.controller_name).to eq("divisions")
    end
  end

  context '.get', :vcr do

    context '#playoffs_results' do
      it 'fetches recent playoffs results' do
        result = LeagueManager::Division.get({:method => "playoffs_results", :id => "1"})
        expect(result.first.home_team_name).to eq("Balkan Mtl")
        expect(result.first.is_playoffs).to eq(true)
      end
    end

    context '#recent_results' do
      it 'returns the recent results of a given division' do
        result = LeagueManager::Division.get({:method => "recent_results", :id => "1"})
        expect(result.last.away_team_name).to eq("UTX Soccer")
      end
    end

    context '#recent_results_with_stats' do
      it 'fetches the extended recent results' do
        result = LeagueManager::Division.get({:method => "recent_results_with_stats", :id => "1"})
        expect(result.first.gamesheets.first.name).to eq("Djogo, Boris")
        expect(result.first.gamesheets.size).to eq(6)
      end
    end

    context '#standings' do
      it 'returns the standings for a given division' do
        result = LeagueManager::Division.get({:method => "standings", :id => "1"})
        expect(result.last.team.name).to eq("UTX Soccer")
        expect(result.last.position).to eq(6)
        expect(result.last.previous_position).to eq(6)
      end
    end

    context '#suspensions' do
      it 'fetches active suspensions' do
        result = LeagueManager::Division.get({:method => "suspensions", :id => "1"})
        expect(result.first.member.name).to eq("Mark, Ruscitto")
      end
    end

    context '#upcoming_games' do
      it 'fetches upcoming games' do
        result = LeagueManager::Division.get({:method => "upcoming_games", :id => "8"})
        expect(result.first.home_team_name).to eq("UTX Soccer")
      end
    end

    context '#top_goalscorers' do
      context 'no limit' do
        it 'fetches the top 10 goalscorers' do
          result = LeagueManager::Division.get({:method => "top_goalscorers", :id => "1"})
          expect(result.first.member.name).to eq("Lopez, Hernan")
        end
      end

      context 'limited to 5' do
        it 'fetches the top 5 goalscorers' do
          result = LeagueManager::Division.get({:method => "top_goalscorers", :id => "1", :limit => 5})
          expect(result.size).to eq(5)
        end
      end
    end

    context '#top_goalkeepers' do
      context 'no limit' do
        it 'fetches the top 10 goalkeepers' do
          result = LeagueManager::Division.top_goalkeepers(9)
          expect(result.first.member.name).to eq("Machika, Sean")
        end
      end

      context 'limited to 1' do
        it 'fetches the top goalkeeper' do
          result = LeagueManager::Division.top_goalkeepers(9, 1)
          expect(result.size).to eq(1)
        end
      end
    end

    context '#goalie_most_shutouts' do
      context 'no limit' do
        it 'fetches the top 10 goalies ordered by shutouts' do
          result = LeagueManager::Division.goalie_most_shutouts(9)
          expect(result.first.member.name).to eq("Machika, Sean")
        end
      end

      context 'limited to 1' do
        it 'fetches the top goalie ordered by shutouts' do
          result = LeagueManager::Division.goalie_most_shutouts(9, 1)
          expect(result.size).to eq(1)
        end
      end
    end

  end

end