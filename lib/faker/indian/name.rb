# frozen_string_literal: true

require "faker"

module Faker
  module Indian
    class Name
      _data = Data.load(:name)

      FIRST_NAMES = _data.fetch(:first_names).freeze
      LAST_NAMES = _data.fetch(:last_names).freeze
      PREFIXES = _data.fetch(:prefixes).freeze

      class << self
        def first_name
          FIRST_NAMES.sample(random: random)
        end

        def last_name
          LAST_NAMES.sample(random: random)
        end

        def full_name
          "#{first_name} #{last_name}"
        end

        def prefix
          PREFIXES.sample(random: random)
        end

        private

        def random
          Faker::Config.random
        end
      end
    end
  end
end
