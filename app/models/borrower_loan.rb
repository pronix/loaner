# == Schema Information
#
# Table name: borrower_loans
#
#  id          :integer         not null, primary key
#  borrower_id :integer         not null
#  loan_id     :integer         not null
#  created_at  :datetime
#  updated_at  :datetime
#

class BorrowerLoan < ActiveRecord::Base
  belongs_to :borrower, :class_name => "Person"
  belongs_to :loan
end
