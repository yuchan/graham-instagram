require 'faraday'

module Graham
  # Your code goes here...
  class Configuration
    attr_accessor :client_id, :client_secret, :redirect_uri, :access_token, :conn

    def initialize
      @conn = Faraday.new "https://api.instagram.com"
    end
    
    def signin_uri
      "https://api.instagram.com/oauth/authorize/?client_id=" + @client_id + "&redirect_uri=" + @redirect_uri + "&response_type=code" + "&scope=" + "basic+public_content+comments+relationships+likes+follower_list"
    end  
  end
end
