# frozen_string_literal: true

require "spec_helper"

RSpec.describe Faker::Indian::Profile do
  describe ".generate" do
    it "returns a hash of Indian profile data" do
      profile = described_class.generate

      expect(profile.keys).to include(:name, :phone, :pan, :aadhaar, :gstin, :upi, :vehicle, :address, :dish)
      expect(profile[:pan]).to match(/\A[A-Z]{5}\d{4}[A-Z]\z/)
    end
  end
end

RSpec.describe Faker::Indian do
  describe ".profile" do
    it "returns a profile hash" do
      profile = described_class.profile

      expect(profile).to be_a(Hash)
      expect(profile).to include(:name, :phone, :pan)
    end
  end
end
