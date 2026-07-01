# frozen_string_literal: true

require "faker"

module Faker
  module Indian
    class Address
      data = Data.load(:address)

      LOCATIONS = data.fetch(:locations).freeze
      STREETS = data.fetch(:streets).freeze
      STATE_CODES = data.fetch(:state_codes).freeze
      DISTRICTS = data.fetch(:districts).freeze
      LANDMARKS = data.fetch(:landmarks).freeze

      class << self
        def city(state: nil)
          sample_location(state: state)[:city]
        end

        def state(state: nil)
          sample_location(state: state)[:state]
        end

        def pincode(state: nil)
          sample_location(state: state)[:pincode]
        end

        def state_code(state: nil)
          sample_location(state: state)[:state_code]
        end

        def district
          DISTRICTS.sample(random: random)
        end

        def landmark
          LANDMARKS.sample(random: random)
        end

        def line1
          "#{random_street_number} #{random_street}"
        end

        def full_address(state: nil)
          loc = sample_location(state: state)
          "#{line1}, #{district}, #{loc[:city]}, #{loc[:state]} - #{loc[:pincode]}"
        end

        private

        def random
          Faker::Config.random
        end

        def sample_location(state: nil)
          city_name, details = filtered_locations(state).to_a.sample(random: random)
          state_name = details[:state]
          {
            city: city_name,
            state: state_name,
            pincode: details[:pincode],
            state_code: lookup_state_code(state_name)
          }
        end

        def filtered_locations(state)
          return LOCATIONS if state.nil?

          matches = LOCATIONS.select { |_, details| state_match?(details[:state], state) }
          raise Error, "unknown state: #{state}" if matches.empty?

          matches
        end

        def state_match?(state_name, filter)
          normalized = filter.to_s.downcase.tr("_", " ")
          return true if state_name.to_s.downcase == normalized

          code = lookup_state_code(state_name)
          code&.casecmp?(filter.to_s)
        end

        def lookup_state_code(state_name)
          STATE_CODES[state_name.to_sym] || STATE_CODES[state_name.to_s]
        end

        def random_street
          STREETS.sample(random: random)
        end

        def random_street_number
          random.rand(1..999)
        end
      end
    end
  end
end
