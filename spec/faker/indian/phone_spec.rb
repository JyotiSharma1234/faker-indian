# frozen_string_literal: true

require "spec_helper"

RSpec.describe Faker::Indian::Phone do
  describe ".mobile_number" do
    it "generates valid Indian mobile format" do
      phone = described_class.mobile_number

      expect(phone).to match(/\A\+91 [6-9]\d{9}\z/)
    end

    it "returns unformatted digits when requested" do
      phone = described_class.mobile_number(formatted: false)

      expect(phone).to match(/\A[6-9]\d{9}\z/)
    end
  end

  describe ".landline" do
    it "generates a landline number" do
      expect(described_class.landline).to match(/\A0\d+-\d{7}\z/)
    end
  end

  describe ".operator" do
    it "returns a known operator" do
      expect(described_class::OPERATORS).to include(described_class.operator)
    end
  end

  describe ".whatsapp_number" do
    it "returns a mobile number" do
      expect(described_class.whatsapp_number).to match(/\A\+91 [6-9]\d{9}\z/)
    end
  end
end
