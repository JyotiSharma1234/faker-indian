# frozen_string_literal: true

require "spec_helper"

RSpec.describe Faker::Indian::Data do
  after { described_class.reset! }

  describe ".load" do
    it "loads name data from yaml" do
      data = described_class.load(:name)

      expect(data).to include(:first_names, :last_names, :prefixes)
      expect(data[:first_names]).to include("Arjun")
    end

    it "caches loaded files" do
      first = described_class.load(:payment)
      second = described_class.load(:payment)

      expect(first).to equal(second)
    end
  end

  describe ".fetch" do
    it "returns nested values" do
      banks = described_class.fetch(:payment, :banks)

      expect(banks).to include(HDFC: "HDFC Bank")
    end
  end
end
