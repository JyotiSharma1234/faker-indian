module Faker
  module Indian
    class Payments
      HANDLES = %w[
        ybl
        oksbi
        okhdfcbank
        paytm
        ibl
      ]

      BANKS = %w[
        HDFC
        SBIN
        ICIC
        AXIS
      ]

      class << self
        def upi_id
          name = %w[
            rahul
            priya
            amit
            sneha
            arjun
          ].sample

          "#{name}#{rand(10..99)}@#{HANDLES.sample}"
        end

        def ifsc
          "#{BANKS.sample}0#{rand(100000..999999)}"
        end
      end
    end
  end
end
