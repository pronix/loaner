class Loan < ActiveRecord::Base
  belongs_to :lender,    :class_name => 'Person'

  has_many :surety_loans
  has_many :sureties, :through => :surety_loans

  has_many :borrower_loans
  has_many :borrowers, :through => :borrower_loans
end
