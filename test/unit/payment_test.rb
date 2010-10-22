# == Schema Information
#
# Table name: payments
#
#  id         :integer         not null, primary key
#  loan_id    :integer         not null
#  amount     :float           default(0.0), not null
#  paid_on    :date
#  remarks    :string(255)
#  created_at :datetime
#  updated_at :datetime
#

require 'test_helper'

class PaymentTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  test "the truth" do
    assert true
  end
end
