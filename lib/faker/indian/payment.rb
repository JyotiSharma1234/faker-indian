# frozen_string_literal: true

require "faker"

module Faker
  module Indian
    class Payment
      _data = Data.load(:payment)

      HANDLES = _data.fetch(:handles).freeze
      BANK_CODES = _data.fetch(:banks).freeze
      NAMES = _data.fetch(:names).freeze

      class << self
        def upi_id
          "#{sample_name}#{random.rand(10..99)}@#{sample_handle}"
        end
        alias upi upi_id

        def ifsc
          code = sample_bank_code
          "#{code}0#{random.rand(100_000..999_999)}"
        end
        alias ifsc_code ifsc

        def bank_name
          BANK_CODES[sample_bank_code]
        end

        def account_number
          random.rand(100_000_000_000..999_999_999_999).to_s
        end

        private

        def random
          Faker::Config.random
        end

        def sample_name
          NAMES.sample(random: random)
        end

        def sample_handle
          HANDLES.sample(random: random)
        end

        def sample_bank_code
          BANK_CODES.keys.sample(random: random)
        end
      end
    end
  end
end
