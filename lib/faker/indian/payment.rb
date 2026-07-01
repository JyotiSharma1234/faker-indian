# frozen_string_literal: true

require "faker"

module Faker
  module Indian
    class Payment
      data = Data.load(:payment)

      HANDLES = data.fetch(:handles).freeze
      BANK_CODES = data.fetch(:banks).freeze
      NAMES = data.fetch(:names).freeze

      class << self
        def upi_id(name: nil)
          handle_name = sanitize_name(name || sample_name)
          "#{handle_name}#{random.rand(10..99)}@#{sample_handle}"
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

        def demat_account
          random.rand(100_000_000_000_000..999_999_999_999_999).to_s
        end

        def bank_details
          code = sample_bank_code
          {
            bank_name: BANK_CODES[code],
            ifsc: "#{code}0#{random.rand(100_000..999_999)}",
            account_number: random.rand(100_000_000_000..999_999_999_999).to_s
          }
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

        def sanitize_name(name)
          name.to_s.downcase.gsub(/\s+/, "")
        end
      end
    end
  end
end
