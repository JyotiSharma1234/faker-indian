# frozen_string_literal: true

require "faker"

module Faker
  module Indian
    class Languages
      data = Data.load(:languages)

      LANGUAGES = data.freeze

      class << self
        def name(language: nil)
          entry(language)[:name]
        end

        def native_name(language: nil)
          entry(language)[:native_name]
        end

        def code(language: nil)
          entry(language)[:code]
        end

        def first_name(language: nil)
          entry(language).fetch(:first_names).sample(random: random)
        end

        def last_name(language: nil)
          entry(language).fetch(:last_names).sample(random: random)
        end

        def full_name(language: nil)
          lang = language || sample_language_key
          "#{first_name(language: lang)} #{last_name(language: lang)}"
        end

        def available
          LANGUAGES.keys
        end

        private

        def random
          Faker::Config.random
        end

        def entry(language)
          LANGUAGES.fetch(resolve_key(language))
        end

        def resolve_key(language)
          return sample_language_key if language.nil?

          key = language.to_s.downcase.tr("-", "_").to_sym
          return key if LANGUAGES.key?(key)

          match = LANGUAGES.find { |_, data| data[:code] == key.to_s }
          return match.first if match

          raise Error, "unknown language: #{language}"
        end

        def sample_language_key
          LANGUAGES.keys.sample(random: random)
        end
      end
    end
  end
end
