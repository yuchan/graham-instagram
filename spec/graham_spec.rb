require 'spec_helper'
require 'json'
require 'dotenv'

Dotenv.load

Graham.configure do |config|
  config.client_id = ENV['CLIENT_ID']
  config.client_secret = ENV['CLIENT_SECRET']
  config.redirect_uri = ENV['REDIRECT_URI']
end

describe Graham do
  it 'has a version number' do
    expect(Graham::VERSION).not_to be nil
  end

  it 'signin_uri' do
    puts Graham.signin_uri
    expect(Graham.signin_uri).not_to be nil
    Graham.get_access_token("242566e6bf374c24ba37f0b9058dfa18") do |token|
      expect(token).to be nil
    end
  end
end
