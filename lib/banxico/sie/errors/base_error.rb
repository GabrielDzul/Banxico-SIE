module Banxico
  module SIE
    module Errors
      class BaseError < StandardError
        attr_accessor :code, :detail

        def initialize(message = '', code: '', detail: '')
          @code = code
          @detail = detail
          super("#{code} #{message}")
        end
      end
    end
  end
end
