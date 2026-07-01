# frozen_string_literal: true

require "spec_helper"

RSpec.describe Faker::Indian::Address do
  describe ".city" do
    it "returns a known city" do
      expect(described_class::LOCATIONS.keys).to include(described_class.city)
    end

    it "filters by state" do
      city = described_class.city(state: "Maharashtra")
      state = described_class::LOCATIONS.fetch(city).fetch(:state)
      expect(state).to eq("Maharashtra")
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

  describe ".state_code" do
    it "returns a known state code" do
      expect(described_class::STATE_CODES.values).to include(described_class.state_code)
    end
  end

  describe ".district" do
    it "returns a known district" do
      expect(described_class::DISTRICTS).to include(described_class.district)
    end
  end

  describe ".landmark" do
    it "returns a known landmark" do
      expect(described_class::LANDMARKS).to include(described_class.landmark)
    end
  end

  describe ".line1" do
    it "returns street line" do
      expect(described_class.line1).to match(/\A\d+ .+\z/)
    end
  end

  describe ".full_address" do
    it "includes city, state, and pincode" do
      address = described_class.full_address(state: "Karnataka")

      expect(address).to match(/\A\d+ .+, .+, .+, Karnataka - \d{6}\z/)
    end
  end
end
