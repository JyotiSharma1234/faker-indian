# frozen_string_literal: true

require "spec_helper"

RSpec.describe Faker::Indian::Languages do
  describe ".name" do
    it "returns a known language name" do
      names = described_class::LANGUAGES.values.map { |entry| entry[:name] }
      expect(names).to include(described_class.name)
    end

    it "returns the requested language name" do
      expect(described_class.name(language: :hindi)).to eq("Hindi")
    end
  end

  describe ".native_name" do
    it "returns a non-empty string" do
      native = described_class.native_name(language: :tamil)
      expect(native).to be_a(String)
      expect(native).not_to be_empty
    end
  end

  describe ".code" do
    it "returns the language code" do
      expect(described_class.code(language: :bengali)).to eq("bn")
    end

    it "accepts a language code" do
      expect(described_class.code(language: "ta")).to eq("ta")
    end
  end

  describe ".first_name" do
    it "returns a name from the language list" do
      names = described_class::LANGUAGES.fetch(:punjabi).fetch(:first_names)
      expect(names).to include(described_class.first_name(language: :punjabi))
    end
  end

  describe ".last_name" do
    it "returns a name from the language list" do
      names = described_class::LANGUAGES.fetch(:gujarati).fetch(:last_names)
      expect(names).to include(described_class.last_name(language: :gujarati))
    end
  end

  describe ".full_name" do
    it "returns two words" do
      expect(described_class.full_name(language: :kannada)).to match(/\A\S+ \S+\z/)
    end
  end

  describe ".available" do
    it "lists all supported languages" do
      expect(described_class.available).to match_array(described_class::LANGUAGES.keys)
    end
  end

  describe "unknown language" do
    it "raises an error" do
      expect { described_class.name(language: :klingon) }
        .to raise_error(Faker::Indian::Error, /unknown language/)
    end
  end
end
