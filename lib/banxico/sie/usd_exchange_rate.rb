module Banxico
  module SIE
    def self.usd_exchange_rate
      response = Banxico::SIE::Client.get path: Endpoints::USD_EXCHANGE_RATE
      response
    end
  end
end
