# frozen_string_literal: true

require "faker"

module Faker
  module Indian
    class Vehicle
      STATE_CODES = Data.load(:vehicle).fetch(:state_codes).freeze
      LETTERS = ("A".."Z").to_a.freeze

      class << self
        def registration_number(state: nil)
          "#{resolve_state_code(state)}#{rto_code}#{series}#{number}"
        end

        def state_code
          STATE_CODES.sample(random: random)
        end

        def rto_code
          format("%02d", random.rand(1..99))
        end

        private

        def random
          Faker::Config.random
        end

        def resolve_state_code(state)
          return state_code if state.nil?

          normalized = state.to_s
          return normalized.upcase if normalized.length == 2

          match = Address::STATE_CODES.find do |name, code|
            name.casecmp?(normalized) || code.casecmp?(normalized)
          end
          return match.last if match

          raise Error, "unknown state: #{state}"
        end

        def series
          Array.new(2) { LETTERS.sample(random: random) }.join
        end

        def number
          format("%04d", random.rand(1..9999))
        end
      end
    end
  end
end
