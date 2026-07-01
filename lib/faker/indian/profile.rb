# frozen_string_literal: true

module Faker
  module Indian
    class Profile
      class << self
        def generate
          {
            name: Name.full_name,
            phone: Phone.mobile_number,
            pan: Identity.pan,
            aadhaar: Identity.aadhaar,
            gstin: Identity.gstin,
            upi: Payment.upi_id,
            vehicle: Vehicle.registration_number,
            address: Address.full_address,
            dish: Food.dish
          }
        end
      end
    end

    def self.profile
      Profile.generate
    end
  end
end
