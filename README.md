# faker-indian

Indian locale data generators for Ruby.

`faker-indian` helps you generate realistic fake Indian data such as names, PAN numbers, Aadhaar numbers, GSTINs, UPI IDs, vehicle registration numbers, phone numbers, addresses, and more.

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
- 💳 Payment & banking details
- 🚗 Vehicle registration numbers
- 🏠 Indian addresses & PIN codes
- 📞 Mobile numbers
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

# Quick Start

```ruby
require 'faker/indian'

Faker::Indian::Name.full_name
# => "Arjun Sharma"

Faker::Indian::Identity.pan
# => "ABCDE1234F"

Faker::Indian::Identity.aadhaar
# => "4567 8912 3456"

Faker::Indian::Payment.upi_id
# => "rahul123@paytm"

Faker::Indian::Vehicle.registration_number
# => "MH12AB1234"
```

---

# Available Generators

## Name

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

## Identity

Generate Indian identity-related data.

### PAN

```ruby
Faker::Indian::Identity.pan
# => "ABCDE1234F"
```

### Aadhaar

```ruby
Faker::Indian::Identity.aadhaar
# => "1234 5678 9012"
```

### GSTIN

```ruby
Faker::Indian::Identity.gstin
# => "27ABCDE1234F1Z5"
```

### Voter ID

```ruby
Faker::Indian::Identity.voter_id
# => "ABC1234567"
```

### Passport Number

```ruby
Faker::Indian::Identity.passport
# => "N1234567"
```

---

## Payment

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

---

## Vehicle

Generate Indian vehicle registration numbers.

```ruby
Faker::Indian::Vehicle.registration_number
# => "KA01MJ4587"

Faker::Indian::Vehicle.state_code
# => "MH"
```

---

## Address

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

## Phone

Generate Indian mobile numbers.

```ruby
Faker::Indian::Phone.mobile_number
# => "+91 9876543210"
```

---

# Rails Usage

## Seeds

```ruby
10.times do
  User.create!(
    name: Faker::Indian::Name.full_name,
    phone: Faker::Indian::Phone.mobile_number,
    pan: Faker::Indian::Identity.pan
  )
end
```

---

## FactoryBot

```ruby
FactoryBot.define do
  factory :user do
    name  { Faker::Indian::Name.full_name }
    phone { Faker::Indian::Phone.mobile_number }
    pan   { Faker::Indian::Identity.pan }
  end
end
```

---

# Validation Notice

This gem generates fake but format-valid data intended only for:

- Testing
- Development
- Mock APIs
- Demo applications

Generated values are **not real identities** and must not be used for fraud, impersonation, or verification systems.

---

# Roadmap

Planned generators:

- [ ] Driving License Number
- [ ] CIN Number
- [ ] Demat Account
- [ ] Regional language names
- [ ] Telecom operators
- [ ] Railway PNR
- [ ] Indian company names

---

# Contributing

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

---

# Development

Run tests:

```bash
bundle exec rspec
```

Run linting:

```bash
bundle exec rubocop
```

---

# License

Released under the MIT License.

---

# Example Output

```ruby
{
  name: "Sneha Kulkarni",
  pan: "BQWPE1234K",
  aadhaar: "4567 1234 8910",
  phone: "+91 9123456789",
  upi: "sneha@okicici",
  vehicle: "MH14DT4321",
  address: "FC Road, Pune, Maharashtra - 411004"
}
```

---

# Why faker-indian?

Most fake-data libraries are heavily US-centric.

`faker-indian` focuses specifically on Indian systems, formats, and identifiers, making it easier to build and test applications for the Indian market.