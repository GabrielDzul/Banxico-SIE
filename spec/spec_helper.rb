require "bundler/setup"
require "banxico/sie"
require 'simplecov'
require 'webmock/rspec'

RSpec.configure do |config|
  # Enable flags like --only-failures and --next-failure
  config.example_status_persistence_file_path = ".rspec_status"

  # Disable RSpec exposing methods globally on `Module` and `main`
  config.disable_monkey_patching!

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end

  config.before(:all) do
    Banxico::SIE.base_uri = 'https://www.banxico.org.mx/SieAPIRest/service/v1/'
    Banxico::SIE.key = 'a93b47366b3b6a6d860717b506272d5806a651c1ffdd823851cf91a3ea4ccea3'
  end
end
