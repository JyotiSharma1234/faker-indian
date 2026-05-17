# frozen_string_literal: true

require "faker"

module Faker
  module Indian
    class Food
      _data = Data.load(:food)

      DISHES = _data.fetch(:dishes).freeze
      RESTAURANTS = _data.fetch(:restaurants).freeze
      CUISINES = _data.fetch(:cuisines).freeze
      STREET_FOOD = _data.fetch(:street_food).freeze
      SWEETS = _data.fetch(:sweets).freeze
      class << self
        def dish
          DISHES.sample(random: random)
        end

        def restaurant_name
          RESTAURANTS.sample(random: random)
        end

        def cuisine
          CUISINES.sample(random: random)
        end

        def street_food
          STREET_FOOD.sample(random: random)
        end

        def sweet
          SWEETS.sample(random: random)
        end

        private

        def random
          Faker::Config.random
        end
      end
    end
  end
end
