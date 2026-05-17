# frozen_string_literal: true

require "spec_helper"

RSpec.describe Faker::Indian::Phone do
  describe ".mobile_number" do
    it "generates valid Indian mobile format" do
      phone = described_class.mobile_number

      expect(phone).to match(/\A\+91 [6-9]\d{9}\z/)
    end
  end
end
