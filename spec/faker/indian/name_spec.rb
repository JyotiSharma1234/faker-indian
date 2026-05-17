# frozen_string_literal: true

require "spec_helper"

RSpec.describe Faker::Indian::Name do
  describe ".first_name" do
    it "returns a non-empty string" do
      name = described_class.first_name
      expect(name).to be_a(String)
      expect(name).not_to be_empty
    end
  end

  describe ".last_name" do
    it "returns a non-empty string" do
      name = described_class.last_name
      expect(name).to be_a(String)
      expect(name).not_to be_empty
    end
  end

  describe ".full_name" do
    it "returns first and last name separated by space" do
      expect(described_class.full_name).to match(/\A\w+ \w+\z/)
    end
  end

  describe ".prefix" do
    it "returns a known prefix" do
      expect(described_class::PREFIXES).to include(described_class.prefix)
    end
  end
end
