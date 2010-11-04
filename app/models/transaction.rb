# == Schema Information
#
# Table name: transactions
#
#  id          :integer         not null, primary key
#  loan_id     :integer         not null
#  type        :integer         default(0), not null
#  amount      :float           not null
#  description :string(255)
#  created_at  :datetime
#  updated_at  :datetime
#

class Transaction < ActiveRecord::Base
  belongs_to :loan
  scope :payments, :conditions => {:transaction_type => "payment"}
  scope :disbursements, :conditions => {:transaction_type => "disbursement"}
end
