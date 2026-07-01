# frozen_string_literal: true

require "faker"

module Faker
  module Indian
    class Travel
      data = Data.load(:travel)

      STATIONS = data.fetch(:stations).freeze
      TRAINS = data.fetch(:trains).freeze

      class << self
        def pnr
          random.rand(1_000_000_000..9_999_999_999).to_s
        end

        def train_name
          TRAINS.sample(random: random)
        end

        def station
          STATIONS.sample(random: random)
        end

        private

        def random
          Faker::Config.random
        end
      end
    end
  end
end
