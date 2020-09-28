require 'spec_helper'

RSpec.describe Banxico::SIE do
  context 'With valid payload' do
    usd_exchange_rate = "22.4573"
    let(:response) do
      {
        "bmx" =>  {
          "series" => [
            {
              "idSerie" => "SF43718",
              "titulo" =>"Tipo de cambio                                          Pesos por d\u00F3lar E.U.A. Tipo de cambio para solventar obligaciones denominadas en moneda extranjera Fecha de determinaci\u00F3n (FIX)",
              "datos" =>  [
                {
                  "fecha" => "28/09/2020",
                  "dato" => usd_exchange_rate
                  }
              ]
            }
          ]
        }
      }
    end

    before do
      # WebMock.allow_net_connect!
      stub_request(:get, "#{Banxico::SIE.base_uri}#{Banxico::SIE::Endpoints::USD_EXCHANGE_RATE}").to_return(
        status: 200,
        body: response.to_json
      )
    end
    

    it 'Returns the current USD exchange rate' do
      response = Banxico::SIE.usd_exchange_rate

      expect(response["bmx"]).to be_truthy
      expect(response["bmx"]["series"][0]["idSerie"]).to eq(Banxico::SIE::Endpoints::USD_EXCHANGE_CODE)
      expect(response["bmx"]["series"][0]["titulo"]).to be_truthy
      expect(response["bmx"]["series"][0]["datos"][0]["fecha"]).to be_truthy
      expect(response["bmx"]["series"][0]["datos"][0]["dato"]).to eq(usd_exchange_rate)
    end
  end
end