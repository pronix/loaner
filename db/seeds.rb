# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)

require "faker"
10.times do
  Person.create :name => Faker::Name.name,
                :birth_at => rand(2000).days.ago,
                :annual_income => rand(100)*1000,
                :email => Faker::Internet.email,
                :home_phone => Faker::PhoneNumber.phone_number,
                :business_phone => Faker::PhoneNumber.phone_number,
                :hand_phone => Faker::PhoneNumber.phone_number,
                :business_address => Faker::Address.street_address,
                :mail_address => Faker::Address.street_address,
                :designation => Faker::Lorem.words(10)
end
