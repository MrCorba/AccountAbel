# frozen_string_literal: true

5.times do
  Client.create(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    company_name: Faker::Company.name,
    address: Faker::Address.street_address,
    zipcode: Faker::Address.zip,
    city: Faker::Address.city,
    country: Faker::Address.country,
    phonenumber: Faker::PhoneNumber.phone_number,
    email: Faker::Internet.email
  )
end
