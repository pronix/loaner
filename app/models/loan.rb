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
  has_many :sureties, :through => :surety_loans, :order => "surety_loans.id"

  has_many :borrower_loans
  has_many :borrowers, :through => :borrower_loans, :order => "borrower_loans.id"

  has_many :transactions, :order => "created_at" do
    def disbursement! options
      Transaction.disbursement!(options.merge(:loan => proxy_owner,
                                              :book => proxy_owner.book))
    end
    def repayment! options
      Transaction.repayment!(options.merge(:loan => proxy_owner,
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
  after_initialize do |loan|
    loan.application ||= Date.today
    loan.first_payment_at ||= Date.today + loan.schedule_period
  end

  validates_presence_of :book
  validates_presence_of :borrowers
  validates_presence_of :amount
  validates_presence_of :account_no
  validates_presence_of :interest
  validates_presence_of :application
  validates_presence_of :interest_type

  SIMPLE_INTEREST_METHODS = ["Monthly", "Weekly", "Forntightly", "Annually"]
  SCHEDULE_TYPE = ["Monthly", "Weekly", "Annually", "Fortnightly", "Custom Configuration"]
  SCHEDULE_TYPE_PERIODS = {
                            "Monthly" => 1.month,
                            "Weekly" => 1.week,
                            "Annually" => 1.year,
                            "Fortnightly" => 2.weeks,
                          }

  state_machine :state, :initial => :new do
    event :disburse do
      transition :new => :active
    end

    event :close do
      transition all => :closed
    end
  end


  delegate :lender, :to => :book
  delegate :repayments, :to => :transactions
  delegate :repayment!, :to => :transactions

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
    paid = repayments.where("date <= ?", date).sum(:principal)
    amount - paid
  end

  # TODO: Need to check this method
  # Days
  def overdue
    if active? && repayments.size < no_of_terms
      (Date.today - repayments.last.date).to_i
    else
      false
    end
  end

  def schedule_period
    unless period = SCHEDULE_TYPE_PERIODS[schedule_type]
      # TODO: Custom Configuration
      period = 1.month
    end
    period
  end

  def schedule_repayment
    interest_fee + principal_fee
  end

  def calculate_payment_schedule
    result = []
    next_date = first_payment_at
    no_of_terms.times do |num|
      result << {:date => next_date, :amount => schedule_repayment}
      next_date = next_date + schedule_period
    end
    result
  end
end
