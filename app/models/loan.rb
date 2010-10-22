# == Schema Information
#
# Table name: loans
#
#  id                           :integer         not null, primary key
#  lender_id                    :integer         not null
#  account_no                   :integer
#  application                  :date
#  loan_type                    :string(255)     default(""), not null
#  state                        :string(255)     not null
#  amount                       :float           default(0.0), not null
#  interest                     :float           default(0.0), not null
#  interest_type                :string(255)     default("simple"), not null
#  simple_interest_method       :integer         default(0)
#  payment_schedule             :integer         default(0)
#  schedule_type                :integer         default(0)
#  grace_period                 :integer         default(0)
#  first_payment_at             :date
#  maturity_at                  :date
#  acceptance_fees              :string(255)
#  revolving_credit_approval    :string(255)
#  late_repayment               :string(255)
#  terms_of_contract_variation  :string(255)
#  cheque_dishonour             :string(255)
#  preclousure_termination_fees :string(255)
#  legal_fees                   :string(255)
#  terms                        :text
#  language                     :string(255)
#  remarks                      :text
#  bankruptcy_declaration       :string(255)
#  created_at                   :datetime
#  updated_at                   :datetime
#

class Loan < ActiveRecord::Base
  belongs_to :lender,    :class_name => 'Person'

  has_many :surety_loans
  has_many :sureties, :through => :surety_loans

  has_many :borrower_loans
  has_many :borrowers, :through => :borrower_loans

  has_many :payments

  validates_presence_of :lender
  validates_presence_of :borrowers
  validates_presence_of :amount
  validates_presence_of :interest

  state_machine :state, :initial => :new do
    event :disburse do
      transition :new => :disbursed
    end

    event :repay do
      transition :disbursed => :repaid
    end
  end
  
end
