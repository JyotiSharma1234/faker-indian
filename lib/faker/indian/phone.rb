# frozen_string_literal: true

require "faker"

module Faker
  module Indian
    class Phone
      class << self
        def mobile_number
          first_digit = random.rand(6..9)
          remaining = random.rand(0..999_999_999)
          "+91 #{first_digit}#{format("%09d", remaining)}"
        end

        private

        def random
          Faker::Config.random
        end
      end
    end
  end
end
