require 'test_helper'

class LoanTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  test "the truth" do
    assert true
  end
end

# == Schema Information
#
# Table name: loans
#
#  id               :integer         not null, primary key
#  lender_id        :integer         not null
#  account_no       :integer
#  application      :date
#  loan_type        :string(255)     default(""), not null
#  state            :string(255)     not null
#  amount           :float           default(0.0), not null
#  interest         :float           default(0.0), not null
#  remarks          :text
#  schedule_type    :integer         default(0)
#  grace_period     :integer         default(0)
#  first_payment_at :date
#  maturity_at      :date
#  created_at       :datetime
#  updated_at       :datetime
#

