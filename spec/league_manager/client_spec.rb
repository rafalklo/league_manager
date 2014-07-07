require 'spec_helper'

describe LeagueManager::Client do
  context '.build_query_string' do
    it 'builds the URI to the resource' do
      client = LeagueManager::Client.new(:endpoint => "dev.utxleaguemanager.com", :api_key => "12345")
      options = {:resource => "divisions"}
      expect( client.build_query_string( options ) ).to eq("http://dev.utxleaguemanager.com/api/divisions")
    end
  end

  context '.build_query_params' do
    it 'it appends the api_key to the params hash' do
      client = LeagueManager::Client.new(:endpoint => "dev.utxleaguemanager.com", :api_key => "12345")
      params = {:id => 50, 'foo' => 'bar'}
      expect( client.build_query_params( params ) ).to eq({:params => {:id => 50, 'foo' => 'bar', :api_key => "12345"}, :accept => client.format})
    end
  end

  context '.get', :vcr do
    it "does a REST call to the api" do
      client = LeagueManager::Client.new(:endpoint => "127.0.0.1:3001", :api_key => "qwerty")
      options = {:resource => "divisions/1/top_goalscorers"}
      result = client.get( options )
      expect(result.size).to equal(10)
    end

    it 'should be able to Marshal the result' do
      client = LeagueManager::Client.new(:endpoint => "127.0.0.1:3001", :api_key => "qwerty")
      options = {:resource => "divisions/1/top_goalscorers"}
      result = client.get( options )
      expect{ Marshal::dump(result) }.not_to raise_error
    end
  end
end