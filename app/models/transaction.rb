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
  attr_accessor :src_book, :dst_book
  attr_accessor :src_account, :dst_account
  attr_accessor :target_loan
  belongs_to :loan
  validates_presence_of :date
  validates_presence_of :amount
  validates_presence_of :transaction_type

  TYPES = [["Payment", "payment"], ["Disbursement", "disbursement"], ["Book Transfer", "book_transfer"], ["Account Transfer", "account_transfer"]]
  scope :payments, :conditions => {:transaction_type => "payment"}
  scope :disbursements, :conditions => {:transaction_type => "disbursement"}

end
