require 'spec_helper'

describe LeagueManager::Base do
  context '.initialize attributes' do
    it 'creates dynamic attributes from {:key => value} pairs' do
      attrs = {:name => "Rafal", :id => 1}
      object = LeagueManager::Base.new( attrs )
      expect(object.id).to eq(1)
      expect(object.name).to eq("Rafal")
    end

    it 'creates dynamic embedded objects from {:object => {:key => :value}} pairs' do
      attrs = {:member => {:name => "Rafal", :id => 1}}
      object = LeagueManager::Player.new( attrs )
      expect(object.member.id).to eq(1)
      expect(object.member.name).to eq("Rafal")
    end

    it 'creates dynamic array of embedded objects from :objects => [{:object => {:key => :value}}]' do
      attrs = {:players => [{:player => {:name => "Rafal", :id => 1}}]}
      object = LeagueManager::Team.new( attrs )
      expect(object.players.first.id).to eq(1)
      expect(object.players.first.name).to eq("Rafal")
    end

    it 'creates objects recursively' do
      attrs = {:team => {:players => [{:player => {:id => 5, :member => {:name => "Rafal", :id => 1}}}]}}
      object = LeagueManager::Standing.new( attrs )
      expect(object.team.players.first.member.name).to eq("Rafal")
    end
  end

  context '.controller_name' do
    it 'returns the name of the remote contoller' do
      object = LeagueManager::Base
      expect(object.controller_name).to eq("bases")
    end
  end

  context '.to_s' do
    it 'provides the hash used to generate the objects' do
      attrs = {:name => "Rafal", :id => 1}
      object = LeagueManager::Base.new( attrs )
      expect(object.to_s).to eq(attrs)
    end
  end
end