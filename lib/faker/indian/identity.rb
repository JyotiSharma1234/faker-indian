# frozen_string_literal: true

require "faker"

module Faker
  module Indian
    # Provides fake identity data specific to the Indian context
    # such as Aadhar numbers, PAN card formats, GSTIN, voterID, passport number.
    class Identity
      data = Data.load(:identity)

      LETTERS = ("A".."Z").to_a.freeze
      PAN_ENTITY_TYPES = data.fetch(:pan_entity_types).freeze
      GSTIN_STATE_CODES = data.fetch(:gstin_state_codes).freeze
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

        def aadhaar_masked
          "XXXX XXXX #{format('%04d', random.rand(0..9999))}"
        end

        def gstin(pan: nil)
          state = GSTIN_STATE_CODES.sample(random: random)
          entity_number = random.rand(1..9)
          checksum = CHECKSUM_CHARS.sample(random: random)
          pan_value = pan || self.pan

          "#{state}#{pan_value}#{entity_number}Z#{checksum}"
        end

        def voter_id
          "#{Array.new(3) { sample_letter }.join}#{random.rand(1_000_000..9_999_999)}"
        end

        def passport
          "#{sample_letter}#{random.rand(1_000_000..9_999_999)}"
        end

        def driving_license(state: nil)
          code = resolve_state_code(state)
          year = random.rand(2010..2024)
          series = format("%02d", random.rand(1..99))
          number = random.rand(1_000_000..9_999_999)

          "#{code}-#{series}-#{year}-#{number}"
        end

        private

        def random
          Faker::Config.random
        end

        def sample_letter
          LETTERS.sample(random: random)
        end

        def resolve_state_code(state)
          return sample_state_code if state.nil?

          normalized = state.to_s
          return normalized.upcase if normalized.length == 2

          match = Address::STATE_CODES.find do |name, code|
            name.casecmp?(normalized) || code.casecmp?(normalized)
          end
          return match.last if match

          raise Error, "unknown state: #{state}"
        end

        def sample_state_code
          Address::STATE_CODES.values.sample(random: random)
        end
      end
    end
  end
end
