require 'rubygems'
require 'httparty'
require 'cgi'
require 'time'

class Temporize
  # TODO: Make HTTParty & Temporize work
  include HTTParty
  base_uri 'https://api.temporize.net/v1'
  format :json
  attr_accessor :credentials

  def initialize(username, password)
    @credentials = {:username => username, :password => password}
  end

  # Check that we can call web service
  def test
    Temporize.get('/test')
  end

  # Check authentication
  def auth
    Temporize.get('/auth', :basic_auth => credentials)
  end

end