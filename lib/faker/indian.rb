# frozen_string_literal: true

require "faker"

require_relative "indian/version"
require_relative "indian/data"
require_relative "indian/name"
require_relative "indian/identity"
require_relative "indian/payment"
require_relative "indian/vehicle"
require_relative "indian/address"
require_relative "indian/phone"

module Faker
  module Indian
    class Error < StandardError; end
  end
end
