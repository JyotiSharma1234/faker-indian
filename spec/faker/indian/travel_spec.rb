# frozen_string_literal: true

require "spec_helper"

RSpec.describe Faker::Indian::Travel do
  describe ".pnr" do
    it "generates a 10-digit PNR" do
      expect(described_class.pnr).to match(/\A\d{10}\z/)
    end
  end

  describe ".train_name" do
    it "returns a known train" do
      expect(described_class::TRAINS).to include(described_class.train_name)
    end
  end

  describe ".station" do
    it "returns a known station" do
      expect(described_class::STATIONS).to include(described_class.station)
    end
  end
end
