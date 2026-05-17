# frozen_string_literal: true

require "yaml"

module Faker
  module Indian
    module Data
      DATA_ROOT = ::File.expand_path("data", __dir__)

      class << self
        def load(name)
          @cache ||= {}
          @cache[name] ||= read_file(name)
        end

        def fetch(name, *keys)
          keys.reduce(load(name)) { |data, key| data.fetch(key) }
        end

        def reset!
          @cache = {}
        end

        private

        def read_file(name)
          path = ::File.join(DATA_ROOT, "#{name}.yml")
          raise Error, "missing data file: #{path}" unless ::File.exist?(path)

          deep_symbolize(YAML.safe_load_file(path))
        end

        def deep_symbolize(value)
          case value
          when Hash
            value.transform_keys(&:to_sym).transform_values { |v| deep_symbolize(v) }
          when Array
            value.map { |item| deep_symbolize(item) }
          else
            value
          end
        end
      end
    end
  end
end
