require 'test_helper'

class BorrowerLoanTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  test "the truth" do
    assert true
  end
end

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

