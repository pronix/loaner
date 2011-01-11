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
  has_many :transactions, :through => :loans

  def balance
    initial_balance + transactions.sum(:amount)
  end

  def balance_at date
    initial_balance + transactions.where(["date <= ?", date]).sum(:amount)
  end

  def payments from = Date.parse("1970-01-01"), to = Time.now
    transactions.payments.where(["date >= ? AND date < ?", from, to])
  end

  def disbursements from = Date.parse("1970-01-01"), to = Time.now
    transactions.disbursements.where(["date >= ? AND date < ?", from, to])
  end
end
