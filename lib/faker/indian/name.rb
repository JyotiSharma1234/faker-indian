# frozen_string_literal: true

require "faker"

module Faker
  module Indian
    class Name
      data = Data.load(:name)

      FIRST_NAMES = data.fetch(:first_names).freeze
      LAST_NAMES = data.fetch(:last_names).freeze
      PREFIXES = data.fetch(:prefixes).freeze
      MIDDLE_NAMES = data.fetch(:middle_names).freeze
      SUFFIXES = data.fetch(:suffixes).freeze

      class << self
        def first_name
          FIRST_NAMES.sample(random: random)
        end

        def last_name
          LAST_NAMES.sample(random: random)
        end

        def middle_name
          MIDDLE_NAMES.sample(random: random)
        end

        def full_name(language: nil)
          return Languages.full_name(language: language) if language

          "#{first_name} #{last_name}"
        end

        def prefix
          PREFIXES.sample(random: random)
        end

        def suffix
          SUFFIXES.sample(random: random)
        end

        private

        def random
          Faker::Config.random
        end
      end
    end
  end
end
