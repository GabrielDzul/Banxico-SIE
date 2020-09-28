module Banxico
  module SIE
    def self.connection
      Faraday.new(url: Banxico::SIE.base_uri ) do |faraday|

        faraday.response :logger
        faraday.adapter Faraday.default_adapter
        faraday.use Faraday::Response::RaiseError
        faraday.headers 'Bmx-Token': Banxico::SIE.key
      end
    end
  end
end
