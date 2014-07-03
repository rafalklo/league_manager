League manager API
==================

By [UTX Web](http://www.utxweb.com/).

[![Code Climate](https://codeclimate.com/github/rafalklo/league_manager.png)](https://codeclimate.com/github/rafalklo/league_manager)
[![Code Climate](https://codeclimate.com/github/rafalklo/league_manager/coverage.png)](https://codeclimate.com/github/rafalklo/league_manager)
[![Build Status](https://api.travis-ci.org/rafalklo/league_manager.png?branch=master)](http://travis-ci.org/rafalklo/league_manager)

Documentation
=============

This is a wrapper gem for the league manager service API develped by UTX Web.

The following methods are exposed by the API.

An `Object` may be one of the following:
* `LeagueManager::Division`
* `LeagueManager::League`

The API is called using the following format

`LeagueManager::Object.get({:method => NAME_OF_METHOD, :id => OPTIONAL, :ANOTHER_OPTION => X})`

### LeagueManager::Division

Division has the following methods available:
* `playoffs_results`
* `recent_results`
* `recent_results_with_stats`
* `standings`
* `suspensions`
* `top_goalscorers` - accepts an optional :limit parameter

### LeagueManager::League
League has the following methods available:
* `index` - don't specify any params OR :method => ""


