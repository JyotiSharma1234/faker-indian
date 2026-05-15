module Faker
  module Indian
    class Identity
      LETTERS = ("A".."Z").to_a

      class << self
        def pan
          first = Array.new(5) { LETTERS.sample }.join
          numbers = rand(1000..9999)
          last = LETTERS.sample

          "#{first}#{numbers}#{last}"
        end

        def aadhaar
          Array.new(12) { rand(0..9) }.join.scan(/.{1,4}/).join(" ")
        end
      end
    end
  end
end
