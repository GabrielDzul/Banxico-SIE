# Banxico::SIE

[![GitHub version](https://badge.fury.io/gh/GABRIELDZUL%2FBANXICO-SIE.svg)](https://badge.fury.io/gh/GABRIELDZUL%2FBANXICO-SIE)

Banxico-SIE offers an interface to consume the [Banxico API](https://www.banxico.org.mx/SieAPIRest/service/v1/)

This project is not endorsed in any way by the Mexican government

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'banxico-sie'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install banxico-sie

## Usage

Add a new initializer and add the following lines
```ruby
require "banxico/sie"

Banxico::SIE.config do |c|
  c.base_uri = "https://www.banxico.org.mx/SieAPIRest/service/v1/"
  c.key = "your_key"
end
```

You can [generate a key here](https://www.banxico.org.mx/SieAPIRest/service/v1/token)

### Querying the current USD exchange rate

To get the current (daily) exchange rate call `usd_exchange_rate`

```ruby
Banxico::SIE.usd_exchange_rate
```

This will return a hash with the following information:
```ruby
{
    "bmx" =>  {
      "series" => [
        {
          "idSerie" => "SF43718",
          "titulo" =>"Tipo de cambio Pesos por d\u00F3lar E.U.A. Tipo d   cambio para solventar                 obligaciones            denominadas en moneda extranjera Fecha de determinaci\u00F3n (FIX)",
          "datos" =>  [
            {
              "fecha" => "28/09/2020",
              "dato" => "22.4573"
              }
          ]
        }
      ]
    }
}
```

**Note** that according to [Banxico](https://www.banxico.org.mx/), the exchange rate for the saturday & sunday will be the same as the friday


## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[GabrielDzul]/banxico-sie.
