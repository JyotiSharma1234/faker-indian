# frozen_string_literal: true

require "spec_helper"

RSpec.describe Faker::Indian::Identity do
  describe ".pan" do
    it "generates valid PAN format" do
      pan = described_class.pan

      expect(pan).to match(/\A[A-Z]{5}\d{4}[A-Z]\z/)
    end
  end

  describe ".aadhaar" do
    it "generates valid Aadhaar format" do
      aadhaar = described_class.aadhaar

      expect(aadhaar).to match(/\A\d{4} \d{4} \d{4}\z/)
    end
  end

  describe ".gstin" do
    it "generates valid GSTIN format" do
      gstin = described_class.gstin

      expect(gstin).to match(/\A\d{2}[A-Z]{5}\d{4}[A-Z]\dZ[A-Z0-9]\z/)
    end
  end

  describe ".voter_id" do
    it "generates valid voter ID format" do
      voter_id = described_class.voter_id

      expect(voter_id).to match(/\A[A-Z]{3}\d{7}\z/)
    end
  end

  describe ".passport" do
    it "generates valid passport format" do
      passport = described_class.passport

      expect(passport).to match(/\A[A-Z]\d{7}\z/)
    end
  end
end
