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

class Loan < ActiveRecord::Base
  belongs_to :lender,    :class_name => 'Person'

  has_many :surety_loans
  has_many :sureties, :through => :surety_loans

  has_many :borrower_loans
  has_many :borrowers, :through => :borrower_loans

  validates_presence_of :lender
  validates_presence_of :borrowers
  validates_presence_of :amount
  validates_presence_of :interest

  state_machine :state, :initial => :new do
    event :grant do
      transition :new => :granted
    end

    event :repay do
      transition :granted => :repaid
    end
  end
  
end
