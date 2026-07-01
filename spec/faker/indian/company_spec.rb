# frozen_string_literal: true

require "spec_helper"

RSpec.describe Faker::Indian::Company do
  describe ".name" do
    it "returns a non-empty company name" do
      name = described_class.name
      expect(name).to be_a(String)
      expect(name).not_to be_empty
    end
  end

  describe ".type" do
    it "returns a known company type" do
      expect(described_class::TYPES).to include(described_class.type)
    end
  end

  describe ".cin" do
    it "generates valid CIN format" do
      expect(described_class.cin).to match(/\AU\d{5}[A-Z]{2}\d{4}PTC\d{6}\z/)
    end
  end
end
