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
  belongs_to :book

  has_many :surety_loans
  has_many :sureties, :through => :surety_loans

  has_many :borrower_loans
  has_many :borrowers, :through => :borrower_loans

  #has_many :payments
  has_many :transactions, :order => "created_at" do
    def disbursement!(amount, date = Date.today, description = nil )
      Transaction.transaction do
        Transaction.create! :loan => proxy_owner, :transaction_type => "disbursement", :amount => amount, :date => date, :description => description
        proxy_owner.book.balance -= amount
        proxy_owner.book.save!
      end
    end
    def payment!(amount, date = Date.today, description = nil )
      Transaction.transaction do
        Transaction.create! :loan => proxy_owner, :transaction_type => "payment", :amount => amount, :date => date, :description => description
        proxy_owner.book.balance += amount
        proxy_owner.book.save!
      end
    end
  end

  after_create {|loan| loan.transactions.disbursement! loan.amount, loan.application}
  after_initialize {|loan| loan.application ||= Date.today }

  validates_presence_of :borrowers
  validates_presence_of :amount
  validates_presence_of :account_no
  validates_presence_of :interest
  validates_presence_of :application
  validates_presence_of :interest_type

  SIMPLE_INTEREST_METHODS = ["Monthly", "Weekly", "Fornightly", "Annually"]
  SCHEDULE_TYPE = ["Monthly", "Weekly", "Annually", "Fornightly", "Custom Configuration"]

  state_machine :state, :initial => :new do
    event :disburse do
      transition :new => :disbursed
    end

    event :repay do
      transition :disbursed => :repaid
    end
  end


  delegate :lender, :to => :book
  delegate :payments, :to => :transactions

  def interest_fee
    ("%.2f" % ((amount * interest / 100) / no_of_terms)).to_f
  end

  def principal_fee
    ("%.2f" % (amount / no_of_terms)).to_f
  end
end
