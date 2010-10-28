class String 
  # Make attribute_name from Human Readable Column Name
  def attrize
    self.gsub(" ", "").underscore
  end
end

Given /^Application has basic configuration$/ do
  And %{Application have test users} 
  And %{Application have test persons} 
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
    l = Loan.new    :account_no     => loan["Account No"],
                    :application    => Time.parse(loan["Application"]),
                    :amount         => loan["Amount"],
                    :type           => loan["Loan type"],
                    :interest       => loan["Interest"],
                    :interest_type  => loan["Interest Type"],
                    :lender         => Person.find_by_name(loan["Lender"])
                    
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

Given /^Payment table$/ do |table|
  table.hashes.each do |payment|
    loan = Loan.find_by_account_no payment["Loan Account No"]
    loan.payments.create  :amount   => payment["Amount"].to_f,
                          :paid_on  => Time.parse(payment["Payment Date"]),
                          :remarks  => payment["Remarks"]
  end
end
