# frozen_string_literal: true

require "spec_helper"

RSpec.describe Faker::Indian::Vehicle do
  describe ".registration_number" do
    it "generates valid registration format" do
      number = described_class.registration_number

      expect(number).to match(/\A[A-Z]{2}\d{2}[A-Z]{2}\d{4}\z/)
    end
  end

  describe ".state_code" do
    it "returns a known state code" do
      expect(described_class::STATE_CODES).to include(described_class.state_code)
    end
  end
end
