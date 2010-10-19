class Person < ActiveRecord::Base
  belongs_to :users
  has_many :lender_loans, :class_name => 'Loan', :foreign_key => :lender_id
  has_many :surety_loans
  has_many :borrower_loans

  has_attached_file :photo, :styles => { :icon => "32x32#", :thumb => "100x100>" }
end
