# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
require "ffaker"

def drop_all_the_things
  puts 'DROP ALL THE THINGS!'
  [Product, Category, Customer].map(&:destroy_all)
end

def set_up_development_database
  200.times do |i|
    products = Product.create(
      {
        company: Faker::Company.name,
        website: Faker::Internet.uri('http'), 
        upc: "ABC #{i}"
        name: Faker::BaconIpsum.words.join(' '),
        price: rand(5..278),
        description: Faker::BaconIpsum.paragraph,

      }
      )
  end


  30.times do |i|
    customers = Customer.create(
    {
      name: Faker::BaconIpsum.words.join(' '),
      last_name: Faker::BaconIpsum.words.join(' '),
      email: Faker::Internet.email,
      contact_phone: Faker::PhoneNumber.short_phone_number,
      street: Faker::Address.street_address,
      city: Faker::Address.city,
      state: Faker::AddressUS.state,
      zip: Faker::AddressUS.zip_code,
    }
     )
  end

  @categories = ["Women's Apparel", "Men's Apparel", "Home", "Children's Apparel", "Automotive", "Grocery", "Footwear"]
  20.times do |i|
    categories = Category.create(
    {
      name: @categories.sample,
      description: Faker::BaconIpsum.paragraph,
    }
      )
  end
end

case Rails.env
  when 'development'
    drop_all_the_things
    set_up_development_database
  when 'production'
    #do nothing
end
