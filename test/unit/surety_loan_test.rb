require 'test_helper'

class SuretyLoanTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  test "the truth" do
    assert true
  end
end

# == Schema Information
#
# Table name: surety_loans
#
#  id         :integer         not null, primary key
#  surety_id  :integer         not null
#  loan_id    :integer         not null
#  created_at :datetime
#  updated_at :datetime
#

