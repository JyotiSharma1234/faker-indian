# frozen_string_literal: true

require "spec_helper"

RSpec.describe Faker::Indian::Address do
  describe ".city" do
    it "returns a known city" do
      expect(described_class::LOCATIONS.keys).to include(described_class.city)
    end
  end

  describe ".state" do
    it "returns a non-empty string" do
      state = described_class.state
      expect(state).to be_a(String)
      expect(state).not_to be_empty
    end
  end

  describe ".pincode" do
    it "generates a 6-digit pincode" do
      expect(described_class.pincode).to match(/\A\d{6}\z/)
    end
  end

  describe ".full_address" do
    it "includes city, state, and pincode" do
      address = described_class.full_address

      expect(address).to match(/\A\d+ .+, .+, .+ - \d{6}\z/)
    end
  end
end
