class String 
  # Make attribute_name from Human Readable Column Name
  def attrize
    self.gsub(" ", "").underscore
  end
end

Given /^Basic configuration$/ do
  And %(Application have admin)
end

And /^Application have admin$/ do
 User.create :username => "admin", :password => "secret", :email => "admin@gmail.com", :password_confirmation => "secret"
end

And /Application ha(?:s|ve) test users/ do
  Factory.create :user
  Factory.create :admin_user
end

Given /^Persons table$/ do |table|
  table.hashes.each do |borrower|
    attrs = {}
    borrower.to_a.each { |a| attrs[a.first.attrize] = a.last }
    Person.create attrs
  end
end

Given /^Loans table$/ do |table|
  table.hashes.each do |loan|
    l = Loan.new    :account_no               => loan["Account No"],
                    :application              => Date.parse(loan["Application"]),
                    :amount                   => loan["Amount"],
                    :type                     => loan["Loan type"],
                    :interest                 => loan["Interest"],
                    :interest_type            => loan["Interest Type"],
                    :no_of_terms              => loan["No of Terms"].to_i,
                    :simple_interest_method   => loan["Simple Interest Method"],
                    :book                     => Book.find_by_name(loan["Book"])
                    
    loan["Borrowers"].split(",").each do |borrower|
      l.borrowers << Person.find_by_name(borrower.strip)
    end
    loan["Sureties"].split(",").each do |surety|
      l.sureties << Person.find_by_name(surety.strip)
    end
    unless l.save
      p l.errors.full_messages
    end
  end
end

Given /^Users table$/ do |table|
  table.hashes.each do |row|
    User.create!  :username => row["Username"], 
                  :email => row["Email"],
                  :name => row["Name"],
                  :password => row["Password"],
                  :password_confirmation => row["Password"]
  end
end

Given /^Books table$/ do |table|
  table.hashes.each do |row|
    Book.create!  :name => row["Name"],
                  :lender => User.find_by_name(row["Lender"])
  end
end

Given /^Payment table$/ do |table|
  table.hashes.each do |payment|
    loan = Loan.find_by_account_no payment["Loan Account No"]
    amount = payment["Amount"]
    amount = amount[1..-1] if amount =~ /^\$/
    loan.payments.create  :amount   => amount.to_f,
                          :paid_on  => Date.parse(payment["Payment Date"]),
                          :remarks  => payment["Remarks"]
  end
end
