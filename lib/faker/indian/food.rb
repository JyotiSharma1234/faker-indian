# frozen_string_literal: true

require "faker"

module Faker
  module Indian
    class Food
      data = Data.load(:food)

      DISHES = data.fetch(:dishes).freeze
      RESTAURANTS = data.fetch(:restaurants).freeze
      CUISINES = data.fetch(:cuisines).freeze
      STREET_FOOD = data.fetch(:street_food).freeze
      SWEETS = data.fetch(:sweets).freeze
      MEALS = data.fetch(:meals).freeze
      BEVERAGES = data.fetch(:beverages).freeze
      SPICE_LEVELS = data.fetch(:spice_levels).freeze

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

        def meal
          MEALS.sample(random: random)
        end

        def beverage
          BEVERAGES.sample(random: random)
        end

        def combo
          "#{dish} with #{beverage}"
        end

        def spice_level
          SPICE_LEVELS.sample(random: random)
        end

        private

        def random
          Faker::Config.random
        end
      end
    end
  end
end
