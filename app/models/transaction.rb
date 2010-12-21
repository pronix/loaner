# == Schema Information
#
# Table name: transactions
#
#  id               :integer         not null, primary key
#  loan_id          :integer
#  transaction_type :string(255)     not null
#  payment_type     :string(255)     not null
#  amount           :float           not null
#  date             :date            not null
#  description      :string(255)
#  created_at       :datetime
#  updated_at       :datetime
#

class Transaction < ActiveRecord::Base
  attr_accessor :src_book, :dst_book
  attr_accessor :src_account, :dst_account
  attr_accessor :target_loan
  belongs_to :loan
  validates_presence_of :date
  validates_presence_of :amount
  validates_presence_of :transaction_type
  validates_presence_of :payment_type

  TYPES = [["Payment", "payment"], ["Disbursement", "disbursement"], ["Book Transfer", "book_transfer"], ["Account Transfer", "account_transfer"]]
  PAYMENT_TYPES = ["cash", "cheque", "interbank"]
  scope :payments, :conditions => {:transaction_type => "payment"}
  scope :disbursements, :conditions => {:transaction_type => "disbursement"}
  scope :cash, :conditions => {:payment_type => "cash"}
  scope :bank, :conditions => {:payment_type => ["cheque", "interbank"]}

  def payment?
    transaction_type == "payment"
  end

  def receipt?
    transaction_type == "disbursement"
  end
  def disbursement?; receipt?; end

end
