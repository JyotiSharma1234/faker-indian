# frozen_string_literal: true

require "faker"

module Faker
  module Indian
    class Phone
      data = Data.load(:phone)

      OPERATORS = data.fetch(:operators).freeze
      STD_CODES = data.fetch(:std_codes).freeze

      class << self
        def mobile_number(formatted: true)
          first_digit = random.rand(6..9)
          remaining = random.rand(0..999_999_999)
          digits = "#{first_digit}#{format('%09d', remaining)}"

          formatted ? "+91 #{digits}" : digits
        end

        def landline
          std = STD_CODES.sample(random: random)
          number = random.rand(1_000_000..9_999_999)
          "0#{std}-#{number}"
        end

        def operator
          OPERATORS.sample(random: random)
        end

        def whatsapp_number(formatted: true)
          mobile_number(formatted: formatted)
        end

        private

        def random
          Faker::Config.random
        end
      end
    end
  end
end
