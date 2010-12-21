# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)

require "faker"
def change_log(stream)
  ActiveRecord::Base.logger = Logger.new(stream)
  ActiveRecord::Base.clear_active_connections!
end

change_log STDOUT

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

3.times do |i|
  user = User.create! :username => "user#{i+1}",
                :name => Faker::Name.name,
                :password => "secret",
                :password_confirmation => "secret",
                :email => Faker::Internet.email

  user.books.create :name => "Cash Book"
  user.books.create :name => "Bank Book"
end


def random_persons
  (1..(rand(3)+1)).map { Person.all.rand }
end

5.times do
  application = ((rand(30)+12).months.ago - rand(30).days)
  loan = Loan.create :account_no => rand(1000),
    :book => Book.all.rand,
    :account_no => rand(9999).to_s,
    :application => application,
    :borrowers => random_persons,
    :sureties => random_persons,
    :amount => ((rand(20)+1) * 1000),
    :interest => rand(30)+1,
    :no_of_terms => rand(36)+1,
    :first_payment_at => (application + 1.month)

  rand(loan.no_of_terms).times do |i|
    loan.transactions.payment! loan.principal_fee + loan.interest_fee,
                              (loan.first_payment_at + i.months)
  end

end
