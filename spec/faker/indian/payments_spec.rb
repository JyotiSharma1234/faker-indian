# frozen_string_literal: true

require "spec_helper"

RSpec.describe Faker::Indian::Payment do
  describe ".upi_id" do
    it "generates a valid UPI ID" do
      upi = described_class.upi_id

      expect(upi).to match(/\A[a-z0-9._]+@[a-z]+\z/)
    end
  end

  describe ".ifsc" do
    it "generates a valid IFSC code" do
      ifsc = described_class.ifsc

      expect(ifsc).to match(/\A[A-Z]{4}0\d{6}\z/)
    end
  end

  describe ".upi" do
    it "works as alias for upi_id" do
      expect(described_class.upi).to be_a(String)
    end
  end

  describe ".ifsc_code" do
    it "works as alias for ifsc" do
      expect(described_class.ifsc_code).to be_a(String)
    end
  end

  describe ".bank_name" do
    it "returns a known bank name" do
      expect(described_class::BANK_CODES.values).to include(described_class.bank_name)
    end
  end

  describe ".account_number" do
    it "generates a 12-digit account number" do
      expect(described_class.account_number).to match(/\A\d{12}\z/)
    end
  end

  describe ".demat_account" do
    it "generates a 15-digit demat account number" do
      expect(described_class.demat_account).to match(/\A\d{15}\z/)
    end
  end

  describe ".bank_details" do
    it "returns linked banking fields" do
      details = described_class.bank_details

      expect(details).to include(:bank_name, :ifsc, :account_number)
      expect(details[:ifsc]).to match(/\A[A-Z]{4}0\d{6}\z/)
    end
  end

  describe ".upi_id with name" do
    it "uses the provided name" do
      expect(described_class.upi_id(name: "Rahul Sharma")).to start_with("rahulsharma")
    end
  end
end
