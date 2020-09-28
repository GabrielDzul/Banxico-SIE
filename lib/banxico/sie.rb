require "banxico/sie/version"
require "banxico/sie/connection"
require "banxico/sie/endpoints"
require "banxico/sie/usd_exchange_rate"
require "banxico/sie/errors/base_error"
require "banxico/sie/errors/network_error"

module Banxico
  module SIE
    def self.config
      yield self
    end
  
    def self.version
      @version
    end
  
    def self.base_uri
      @base_uri
    end
  
    def self.base_uri=(base_uri)
      @base_uri = base_uri
    end
  
    def self.key
      @key
    end
  
    def self.key=(key)
      @key = key
    end
  end
end
