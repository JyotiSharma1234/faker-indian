# faker-indian

India-first fake data generator for Ruby apps.

`faker-indian` helps you generate realistic fake Indian data — names, identities, payments, addresses, vehicles, regional-language names, food, companies, railway PNRs, and more.

Perfect for:

- Rails seed data
- FactoryBot fixtures
- API mocks
- Testing & development
- Demo applications

---

## Features

- 🇮🇳 Indian-first fake data generation
- 👤 Indian names & identities (PAN, Aadhaar, GSTIN, driving license, and more)
- 🌐 Regional language names (Hindi, Tamil, Telugu, and more)
- 💳 Payment & banking details (UPI, IFSC, demat account)
- 🏢 Company names & CIN numbers
- 🚂 Railway PNR, train names, and stations
- 🚗 Vehicle registration numbers
- 🏠 Indian addresses across 70+ cities
- 📞 Mobile, landline, and telecom operators
- 🍛 Indian dishes, cuisines, and restaurants
- 📋 One-shot `Faker::Indian.profile` for seed data
- 📁 YAML-backed data — easy to extend without changing logic
- ⚡ Lightweight and easy to use

---

## Installation

Add this line to your application's Gemfile:

```ruby
gem "faker-indian"
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

Faker::Indian::Payment.upi_id
# => "rahul42@paytm"

Faker::Indian::Languages.full_name(language: :tamil)
# => "Karthik Iyer"

Faker::Indian::Company.cin
# => "U72200MH2010PTC123456"

Faker::Indian.profile
# => { name: "...", phone: "...", pan: "...", ... }
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

Faker::Indian::Name.middle_name
# => "Kumar"

Faker::Indian::Name.full_name
# => "Rohan Verma"

Faker::Indian::Name.full_name(language: :hindi)
# => "Ananya Sharma"

Faker::Indian::Name.prefix
# => "Dr."

Faker::Indian::Name.suffix
# => "Ji"
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

Faker::Indian::Identity.aadhaar_masked
# => "XXXX XXXX 4567"

Faker::Indian::Identity.gstin
# => "27ABCDE1234F1Z5"

Faker::Indian::Identity.gstin(pan: "ABCDE1234F")
# => "27ABCDE1234F1Z5"  # embeds the given PAN

Faker::Indian::Identity.voter_id
# => "ABC1234567"

Faker::Indian::Identity.passport
# => "N1234567"

Faker::Indian::Identity.driving_license
# => "MH-12-2018-4567890"

Faker::Indian::Identity.driving_license(state: "Karnataka")
# => "KA-04-2022-1234567"
```

---

### Payment

Generate fake Indian banking and payment data.

```ruby
Faker::Indian::Payment.upi_id
# => "amit@oksbi"

Faker::Indian::Payment.upi_id(name: "Rahul Sharma")
# => "rahulsharma42@paytm"

Faker::Indian::Payment.ifsc
# => "HDFC0001234"

Faker::Indian::Payment.bank_name
# => "State Bank of India"

Faker::Indian::Payment.account_number
# => "123456789012"

Faker::Indian::Payment.demat_account
# => "120816001234567"

Faker::Indian::Payment.bank_details
# => { bank_name: "HDFC Bank", ifsc: "HDFC0001234", account_number: "123456789012" }
```

Aliases: `upi` (for `upi_id`), `ifsc_code` (for `ifsc`).

---

### Company

Generate Indian company names and CIN numbers.

```ruby
Faker::Indian::Company.name
# => "Bharat Tech Solutions Pvt Ltd"

Faker::Indian::Company.type
# => "Private Limited"

Faker::Indian::Company.cin
# => "U72200MH2010PTC123456"
```

---

### Travel

Generate railway-related fake data.

```ruby
Faker::Indian::Travel.pnr
# => "4829173056"

Faker::Indian::Travel.train_name
# => "Rajdhani Express"

Faker::Indian::Travel.station
# => "Mumbai CST"
```

---

### Vehicle

Generate Indian vehicle registration numbers.

```ruby
Faker::Indian::Vehicle.registration_number
# => "KA01MJ4587"

Faker::Indian::Vehicle.registration_number(state: "MH")
# => "MH14DT4321"

Faker::Indian::Vehicle.state_code
# => "MH"

Faker::Indian::Vehicle.rto_code
# => "12"
```

---

### Address

Generate realistic Indian addresses across 70+ cities.

Pass `state:` as a state name (`"Maharashtra"`) or code (`"MH"`) to filter location methods.

```ruby
Faker::Indian::Address.city
# => "Pune"

Faker::Indian::Address.city(state: "Karnataka")
# => "Bengaluru"

Faker::Indian::Address.state
# => "Maharashtra"

Faker::Indian::Address.pincode
# => "411001"

Faker::Indian::Address.state_code
# => "MH"

Faker::Indian::Address.district
# => "Koramangala"

Faker::Indian::Address.landmark
# => "Near Metro Station"

Faker::Indian::Address.line1
# => "221 MG Road"

Faker::Indian::Address.full_address
# => "221 MG Road, Koramangala, Pune, Maharashtra - 411001"

Faker::Indian::Address.full_address(state: "Gujarat")
# => "45 Ring Road, Satellite, Ahmedabad, Gujarat - 380001"
```

---

### Phone

Generate Indian phone numbers and telecom data.

```ruby
Faker::Indian::Phone.mobile_number
# => "+91 9876543210"

Faker::Indian::Phone.mobile_number(formatted: false)
# => "9876543210"

Faker::Indian::Phone.landline
# => "022-1234567"

Faker::Indian::Phone.operator
# => "Jio"

Faker::Indian::Phone.whatsapp_number
# => "+91 9123456789"
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

Faker::Indian::Food.meal
# => "lunch"

Faker::Indian::Food.beverage
# => "Filter Coffee"

Faker::Indian::Food.combo
# => "Masala Dosa with Filter Coffee"

Faker::Indian::Food.spice_level
# => "medium"
```

---

### Profile

Generate a complete Indian user profile in one call — ideal for seeds and demos.

```ruby
Faker::Indian.profile
# or
Faker::Indian::Profile.generate

# =>
# {
#   name: "Sneha Kulkarni",
#   phone: "+91 9123456789",
#   pan: "BQWPE1234K",
#   aadhaar: "4567 1234 8910",
#   gstin: "27BQWPE1234K1Z5",
#   upi: "sneha@okicici",
#   vehicle: "MH14DT4321",
#   address: "221 FC Road, Andheri, Pune, Maharashtra - 411001",
#   dish: "Masala Dosa"
# }
```

---

## Data Files

Static data lives in YAML files under `lib/faker/indian/data/` and is loaded by `Faker::Indian::Data`:

| File | Used by |
|------|---------|
| `name.yml` | `Name` |
| `languages.yml` | `Languages` |
| `identity.yml` | `Identity` |
| `payment.yml` | `Payment` |
| `company.yml` | `Company` |
| `travel.yml` | `Travel` |
| `vehicle.yml` | `Vehicle` |
| `address.yml` | `Address` |
| `phone.yml` | `Phone` |
| `food.yml` | `Food` |

To add entries, edit the relevant YAML file. To add a new generator, create a new YAML file and a matching Ruby class that calls `Data.load(:your_file)`.

---

## Rails Usage

### Seeds

```ruby
10.times do
  profile = Faker::Indian.profile

  User.create!(
    name: profile[:name],
    phone: profile[:phone],
    pan: profile[:pan],
    upi: profile[:upi],
    address: profile[:address]
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

  factory :company do
    name { Faker::Indian::Company.name }
    cin  { Faker::Indian::Company.cin }
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

- [ ] Driving License Number *(format implemented — checksum validation pending)*
- [x] CIN Number
- [x] Demat Account
- [x] Regional language names
- [x] Telecom operators
- [x] Railway PNR
- [ ] Indian company names *(basic generator added — expand data)*
- [ ] Commerce (HSN codes, invoice numbers)
- [ ] Education (schools, universities)

---

## Contributing

Bug reports and pull requests are welcome.

1. Fork the repository
2. Create your feature branch

```bash
git checkout -b feature/my-feature
```

3. Commit changes

```bash
git commit -m "Add new generator"
```

4. Push to branch

```bash
git push origin feature/my-feature
```

5. Open a Pull Request

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
profile = Faker::Indian.profile

# {
#   name: "Sneha Kulkarni",
#   phone: "+91 9123456789",
#   pan: "BQWPE1234K",
#   aadhaar: "4567 1234 8910",
#   gstin: "27BQWPE1234K1Z5",
#   upi: "sneha@okicici",
#   vehicle: "MH14DT4321",
#   address: "221 FC Road, Andheri, Pune, Maharashtra - 411001",
#   dish: "Masala Dosa"
# }

Faker::Indian::Languages.full_name(language: :tamil)
# => "Arun Iyer"

Faker::Indian::Travel.pnr
# => "4829173056"

Faker::Indian::Company.name
# => "Hindustan Logistics LLP"
```

---

## Why faker-indian?

Most fake-data libraries are heavily US-centric.

`faker-indian` focuses specifically on Indian systems, formats, and identifiers, making it easier to build and test applications for the Indian market.
