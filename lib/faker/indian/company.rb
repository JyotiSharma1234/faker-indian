# frozen_string_literal: true

require "faker"

module Faker
  module Indian
    class Company
      data = Data.load(:company)

      PREFIXES = data.fetch(:prefixes).freeze
      CORES = data.fetch(:cores).freeze
      SUFFIXES = data.fetch(:suffixes).freeze
      TYPES = data.fetch(:types).freeze

      class << self
        def name
          "#{PREFIXES.sample(random: random)} #{CORES.sample(random: random)} #{SUFFIXES.sample(random: random)}"
        end

        def type
          TYPES.sample(random: random)
        end

        def cin
          state = Address::STATE_CODES.values.sample(random: random)
          year = random.rand(2000..2024)
          industry = format("%05d", random.rand(10_000..99_999))
          serial = format("%06d", random.rand(100_000..999_999))

          "U#{industry}#{state}#{year}PTC#{serial}"
        end

        private

        def random
          Faker::Config.random
        end
      end
    end
  end
end
