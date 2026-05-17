# frozen_string_literal: true

require "spec_helper"

RSpec.describe Faker::Indian::Food do
  describe ".dish" do
    it "returns a known dish" do
      expect(described_class::DISHES).to include(described_class.dish)
    end
  end

  describe ".restaurant_name" do
    it "returns a known restaurant" do
      expect(described_class::RESTAURANTS).to include(described_class.restaurant_name)
    end
  end

  describe ".cuisine" do
    it "returns a known cuisine" do
      expect(described_class::CUISINES).to include(described_class.cuisine)
    end
  end

  describe ".street_food" do
    it "returns a known street food item" do
      expect(described_class::STREET_FOOD).to include(described_class.street_food)
    end
  end
end
