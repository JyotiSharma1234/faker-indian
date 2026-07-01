## [Unreleased]

## [0.2.0] - 2026-07-01

### Added

- `Faker::Indian::Company` with `name`, `type`, and `cin`
- `Faker::Indian::Travel` with `pnr`, `train_name`, and `station`
- `Faker::Indian::Profile.generate` and `Faker::Indian.profile` for one-shot seed data
- `phone.yml` for telecom operator and STD code data
- `company.yml` and `travel.yml` data files

### Changed

- **Address** — fixed YAML nesting for 40+ cities; added `district`, `landmark`, `line1`, `state_code`, and `state:` filtering on location methods
- **Identity** — added `driving_license`, `aadhaar_masked`, and `gstin(pan:)`
- **Payment** — added `demat_account`, `bank_details`, and `upi_id(name:)`
- **Phone** — added `operator`, `landline`, `whatsapp_number`, and `mobile_number(formatted:)`
- **Vehicle** — added `registration_number(state:)`, public `rto_code`, and state name/code resolution
- **Name** — added `middle_name`, `suffix`, and `full_name(language:)`
- **Food** — added `meal`, `beverage`, `combo`, and `spice_level`
- **address.yml** — added `state_codes`, `districts`, and `landmarks`

## [0.1.0] - 2026-05-14

### Added

- Initial release with `Name`, `Identity`, `Payment`, `Vehicle`, `Address`, `Phone`, `Food`, and `Languages` generators
- YAML-backed data loading via `Faker::Indian::Data`
