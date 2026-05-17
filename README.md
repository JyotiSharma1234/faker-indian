# faker-indian

India-first fake data generator for Ruby apps.

`faker-indian` helps you generate realistic fake Indian data such as names, PAN numbers, Aadhaar numbers, GSTINs, UPI IDs, vehicle registration numbers, phone numbers, addresses, regional-language names, food items, and more.

Perfect for:

- Rails seed data
- FactoryBot fixtures
- API mocks
- Testing & development
- Demo applications

---

## Features

- 🇮🇳 Indian-first fake data generation
- 👤 Indian names & identities
- 🌐 Regional language names (Hindi, Tamil, Telugu, and more)
- 💳 Payment & banking details
- 🚗 Vehicle registration numbers
- 🏠 Indian addresses & PIN codes
- 📞 Mobile numbers
- 🍛 Indian dishes, cuisines, and restaurants
- 📁 YAML-backed data — easy to extend without changing logic
- ⚡ Lightweight and easy to use

---

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'faker-indian'
```

Then execute:

```bash
bundle install
```

Or install manually:

```bash
gem install faker-indian
```

---

## Quick Start

```ruby
require "faker/indian"

Faker::Indian::Name.full_name
# => "Arjun Sharma"

Faker::Indian::Identity.pan
# => "ABCDE1234F"

Faker::Indian::Identity.aadhaar
# => "4567 8912 3456"

Faker::Indian::Identity.aadhaar
# => "4567 8912 3456"

Faker::Indian::Payment.upi_id
# => "rahul123@paytm"
Faker::Vehicle::
Faker::Indian::Languages.full_name(language: :tamil)
# => "Karthik Iyer"

Faker::Indian::Food.dish
# => "Masala Dosa"
```

---

## Available Generators

### Name

Generate Indian names.

```ruby
Faker::Indian::Name.first_name
# => "Priya"

Faker::Indian::Name.last_name
# => "Patel"

Faker::Indian::Name.full_name
# => "Rohan Verma"

Faker::Indian::Name.prefix
# => "Dr."
```

---

### Languages

Generate names and metadata for major Indian languages.

Supported languages: Hindi, Tamil, Telugu, Bengali, Marathi, Gujarati, Kannada, Malayalam, and Punjabi.

Pass a language as a symbol (`:hindi`), language name, or ISO-style code (`"hi"`, `"ta"`). Omit `language:` to pick one at random.

```ruby
Faker::Indian::Languages.name
# => "Tamil"

Faker::Indian::Languages.name(language: :hindi)
# => "Hindi"

Faker::Indian::Languages.native_name(language: :tamil)
# => "தமிழ்"

Faker::Indian::Languages.code(language: :bengali)
# => "bn"

Faker::Indian::Languages.first_name(language: :punjabi)
# => "Simran"

Faker::Indian::Languages.full_name(language: :gujarati)
# => "Jay Patel"

Faker::Indian::Languages.available
# => [:hindi, :tamil, :telugu, :bengali, :marathi, :gujarati, :kannada, :malayalam, :punjabi]
```

---

### Identity

Generate Indian identity-related data.

```ruby
Faker::Indian::Identity.pan
# => "ABCDE1234F"

Faker::Indian::Identity.aadhaar
# => "1234 5678 9012"

Faker::Indian::Identity.gstin
# => "27ABCDE1234F1Z5"

Faker::Indian::Identity.voter_id
# => "ABC1234567"

Faker::Indian::Identity.passport
# => "N1234567"
```

---

### Payment

Generate fake Indian banking and payment data.

```ruby
Faker::Indian::Payment.upi_id
# => "amit@oksbi"

Faker::Indian::Payment.ifsc
# => "HDFC0001234"

Faker::Indian::Payment.bank_name
# => "State Bank of India"

Faker::Indian::Payment.account_number
# => "123456789012"
```

Aliases: `upi` (for `upi_id`), `ifsc_code` (for `ifsc`).

---

### Vehicle

Generate Indian vehicle registration numbers.

```ruby
Faker::Indian::Vehicle.registration_number
# => "KA01MJ4587"

Faker::Indian::Vehicle.state_code
# => "MH"
```

---

### Address

Generate realistic Indian addresses.

```ruby
Faker::Indian::Address.city
# => "Pune"

Faker::Indian::Address.state
# => "Maharashtra"

Faker::Indian::Address.pincode
# => "411001"

Faker::Indian::Address.full_address
# => "221 MG Road, Pune, Maharashtra - 411001"
```

---

### Phone

Generate Indian mobile numbers.

```ruby
Faker::Indian::Phone.mobile_number
# => "+91 9876543210"
```

---

### Food

Generate Indian food-related data.

```ruby
Faker::Indian::Food.dish
# => "Hyderabadi Biryani"

Faker::Indian::Food.restaurant_name
# => "Saravana Bhavan"

Faker::Indian::Food.cuisine
# => "South Indian"

Faker::Indian::Food.street_food
# => "Pani Puri"

Faker::Indian::Food.sweet
# => "Gulab Jamun"
```

---

## Data Files

Static data lives in YAML files under `lib/faker/indian/data/` and is loaded by `Faker::Indian::Data`:


| File            | Used by     |
| --------------- | ----------- |
| `name.yml`      | `Name`      |
| `languages.yml` | `Languages` |
| `identity.yml`  | `Identity`  |
| `payment.yml`   | `Payment`   |
| `vehicle.yml`   | `Vehicle`   |
| `address.yml`   | `Address`   |
| `food.yml`      | `Food`      |


To add entries, edit the relevant YAML file. To add a new generator, create a new YAML file and a matching Ruby class that calls `Data.load(:your_file)`.

---

## Rails Usage

### Seeds

```ruby
10.times do
  User.create!(
    name: Faker::Indian::Name.full_name,
    phone: Faker::Indian::Phone.mobile_number,
    pan: Faker::Indian::Identity.pan,
    upi: Faker::Indian::Payment.upi_id
  )
end
```

### FactoryBot

```ruby
FactoryBot.define do
  factory :user do
    name  { Faker::Indian::Name.full_name }
    phone { Faker::Indian::Phone.mobile_number }
    pan   { Faker::Indian::Identity.pan }
  end

  factory :restaurant do
    name    { Faker::Indian::Food.restaurant_name }
    cuisine { Faker::Indian::Food.cuisine }
  end
end
```

---

## Validation Notice

This gem generates fake but format-valid data intended only for:

- Testing
- Development
- Mock APIs
- Demo applications

Generated values are **not real identities** and must not be used for fraud, impersonation, or verification systems.

---

## Roadmap

Planned generators:

- Driving License Number
- CIN Number
- Demat Account
- Regional language names
- Telecom operators
- Railway PNR

---

## Contributing

Bug reports and pull requests are welcome.

1. Fork the repository
2. Create your feature branch

```bash
git checkout -b feature/my-feature
```

1. Commit changes

```bash
git commit -m "Add new generator"
```

1. Push to branch

```bash
git push origin feature/my-feature
```

1. Open a Pull Request

When adding generators, include YAML data, Ruby class, and RSpec tests.

---

## Development

Run tests:

```bash
bundle exec rspec
```

Run linting:

```bash
bundle exec rubocop
```

---

## License

Released under the MIT License.

---

## Example Output

```ruby
{
  name: "Sneha Kulkarni",
  regional_name: "அருண் ஐயர்",
  pan: "BQWPE1234K",
  aadhaar: "4567 1234 8910",
  phone: "+91 9123456789",
  upi: "sneha@okicici",
  vehicle: "MH14DT4321",
  address: "221 FC Road, Pune, Maharashtra - 411001",
  dish: "Masala Dosa",
  sweet: "Gulab Jamun"
}
```

---

## Why faker-indian?

Most fake-data libraries are heavily US-centric.

`faker-indian` focuses specifically on Indian systems, formats, and identifiers, making it easier to build and test applications for the Indian market.