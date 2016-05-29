require "graham/version"
require "graham/configuration"
require "graham/api"

module Graham
  class << self
    def configure
      @config ||= Configuration.new
      yield(@config) if block_given?
      @config
    end
  
    def config
      @config || configure
    end
    
    def signin_uri
      @config.signin_uri
    end
  end

  extend API
end


