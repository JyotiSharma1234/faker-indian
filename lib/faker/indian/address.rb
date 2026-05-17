# frozen_string_literal: true

require "faker"

module Faker
  module Indian
    class Address
      _data = Data.load(:address)

      LOCATIONS = _data.fetch(:locations).freeze
      STREETS = _data.fetch(:streets).freeze

      class << self
        def city
          sample_location[:city]
        end

        def state
          sample_location[:state]
        end

        def pincode
          sample_location[:pincode]
        end

        def full_address
          loc = sample_location
          "#{random_street_number} #{random_street}, #{loc[:city]}, #{loc[:state]} - #{loc[:pincode]}"
        end

        private

        def random
          Faker::Config.random
        end

        def sample_location
          city_name, details = LOCATIONS.to_a.sample(random: random)
          { city: city_name, state: details[:state], pincode: details[:pincode] }
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
