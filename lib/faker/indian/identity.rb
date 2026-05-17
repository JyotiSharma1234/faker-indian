# frozen_string_literal: true

require "faker"

module Faker
  module Indian
    class Identity
      _data = Data.load(:identity)

      LETTERS = ("A".."Z").to_a.freeze
      PAN_ENTITY_TYPES = _data.fetch(:pan_entity_types).freeze
      GSTIN_STATE_CODES = _data.fetch(:gstin_state_codes).freeze
      CHECKSUM_CHARS = (("0".."9").to_a + LETTERS).freeze

      class << self
        def pan
          first_three = Array.new(3) { sample_letter }.join
          entity_type = PAN_ENTITY_TYPES.sample(random: random)
          surname_initial = sample_letter
          numbers = random.rand(1000..9999)
          last = sample_letter

          "#{first_three}#{entity_type}#{surname_initial}#{numbers}#{last}"
        end

        def aadhaar
          Array.new(12) { random.rand(0..9) }
               .join
               .scan(/.{1,4}/)
               .join(" ")
        end

        def gstin
          state = GSTIN_STATE_CODES.sample(random: random)
          entity_number = random.rand(1..9)
          checksum = CHECKSUM_CHARS.sample(random: random)

          "#{state}#{pan}#{entity_number}Z#{checksum}"
        end

        def voter_id
          "#{Array.new(3) { sample_letter }.join}#{random.rand(1_000_000..9_999_999)}"
        end

        def passport
          "#{sample_letter}#{random.rand(1_000_000..9_999_999)}"
        end

        private

        def random
          Faker::Config.random
        end

        def sample_letter
          LETTERS.sample(random: random)
        end
      end
    end
  end
end
