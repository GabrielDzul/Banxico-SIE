module Banxico
  module SIE
    module Client 
      def self.get(path:, body:, headers: {})
        response = Banxico::SIE.connection.get path, body, headers
        JSON.parse(response.body)
      rescue Faraday::ConnectionFailed, Faraday::TimeoutError
        raise Banxico::SIE::Erros::NetworkError
      end
    end
  end
end
