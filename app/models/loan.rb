# == Schema Information
#
# Table name: loans
#
#  id                           :integer         not null, primary key
#  book_id                      :integer         not null
#  account_no                   :integer
#  application                  :date
#  loan_type                    :string(255)
#  state                        :string(255)     not null
#  amount                       :float           default(0.0), not null
#  interest                     :float           default(0.0), not null
#  no_of_terms                  :integer         default(1)
#  interest_type                :string(255)     default("simple"), not null
#  simple_interest_method       :string(255)
#  schedule_type                :string(255)
#  grace_period                 :integer         default(0)
#  first_payment_at             :date
#  maturity_at                  :date
#  acceptance_fees              :float
#  revolving_credit_approval    :float
#  late_repayment               :float
#  terms_of_contract_variation  :float
#  cheque_dishonour             :float
#  preclousure_termination_fees :float
#  legal_fees                   :float
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

  has_many :transactions, :order => "created_at" do
    def disbursement! options
      Transaction.disbursement!(options.merge(:loan => proxy_owner,
                                              :book => proxy_owner.book))
    end
    def payment! options
      Transaction.payment!(options.merge(:loan => proxy_owner,
                                         :book => proxy_owner.book))
    end
  end

  after_create do |loan|
    options = {:amount => loan.amount, :date => loan.application}
    options[:payment_type] = loan.loan_type if loan.loan_type
    Loan.transaction do
      loan.transactions.disbursement! options
      loan.disburse!
    end
  end
  after_initialize {|loan| loan.application ||= Date.today }

  validates_presence_of :book
  validates_presence_of :borrowers
  validates_presence_of :amount
  validates_presence_of :account_no
  validates_presence_of :interest
  validates_presence_of :application
  validates_presence_of :interest_type

  SIMPLE_INTEREST_METHODS = ["Monthly", "Weekly", "Forntightly", "Annually"]
  SCHEDULE_TYPE = ["Monthly", "Weekly", "Annually", "Fortnightly", "Custom Configuration"]

  state_machine :state, :initial => :new do
    event :disburse do
      transition :new => :active
    end

    event :repay do
      transition :disbursed => :repaid
    end

    event :close do
      transition all => :closed
    end
  end


  delegate :lender, :to => :book
  delegate :payments, :to => :transactions
  delegate :payment!, :to => :transactions

  def to_label
    "Account No: #{account_no}"
  end

  def interest_fee
    ("%.2f" % ((amount * interest / 100) / no_of_terms)).to_f
  end

  def principal_fee
    ("%.2f" % (amount / no_of_terms)).to_f
  end

  def outstanding_principal date = Date.today
    paid = payments.where("date <= ?", date).sum(:principal)
    amount - paid
  end
end
