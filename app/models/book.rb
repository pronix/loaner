# == Schema Information
#
# Table name: books
#
#  id              :integer         not null, primary key
#  lender_id       :integer         not null
#  name            :string(255)
#  initial_balance :float           default(0.0), not null
#  created_at      :datetime
#  updated_at      :datetime
#

class Book < ActiveRecord::Base
  belongs_to :lender, :class_name => "User"
  has_many  :loans
  has_many :transactions#, :through => :loans
  include DefaultPeriod

  def balance
    initial_balance + transactions.sum(:amount)
  end

  def balance_at date
    initial_balance + transactions.where(["date <= ?", date]).sum(:amount)
  end

  def receipts options = {}
    options = default_period options
    transactions.receipts.where(["date >= ? AND date < ?", options[:from], options[:to]])
  end
  def receipts_sum options = {}
    options = default_period options
    receipts(options).sum :amount
  end


  def repayments options = {}
    options = default_period options
    transactions.repayments.where(["date >= ? AND date < ?", options[:from], options[:to]])
  end
  def repayments_sum options = {}
    options = default_period options
    repayments(options).sum :amount
  end


  def payments options = {}
    options = default_period options
    transactions.payments.where(["date >= ? AND date < ?", options[:from], options[:to]])
  end
  def payments_sum options = {}
    options = default_period options
    payments(options).sum :amount
  end


  def disbursements options = {}
    options = default_period options
    transactions.disbursements.where(["date >= ? AND date < ?", options[:from], options[:to]])
  end

  def principals_sum options = {}
    options = default_period options
    repayments(options).sum :principal
  end

  def interests_sum options = {}
    options = default_period options
    repayments(options).sum :interest
  end

end
