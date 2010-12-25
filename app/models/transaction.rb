# == Schema Information
#
# Table name: transactions
#
#  id               :integer         not null, primary key
#  book_id          :integer         not null
#  loan_id          :integer
#  date             :date            not null
#  transaction_type :string(255)     not null
#  payment_type     :string(255)     not null
#  amount           :float           default(0.0), not null
#  regular          :float           default(0.0), not null
#  principal        :float           default(0.0), not null
#  interest         :float           default(0.0), not null
#  late_interest    :float           default(0.0), not null
#  permitted_fee    :float           default(0.0), not null
#  description      :string(255)
#  created_at       :datetime
#  updated_at       :datetime
#

class Transaction < ActiveRecord::Base
  attr_accessor :src_book, :dst_book
  attr_accessor :src_account, :dst_account
  attr_accessor :target_loan

  TRANSACTION_TYPES = ["payment", "disbursement", "book_transfer", "account_transfer"]
  TRANSACTION_PAYMENT           = TRANSACTION_TYPES[0]
  TRANSACTION_DISBURSEMENT      = TRANSACTION_TYPES[1]
  TRANSACTION_BOOK_TRANSFER     = TRANSACTION_TYPES[2]
  TRANSACTION_ACCOUNT_TRANSFER  = TRANSACTION_TYPES[3]

  PAYMENT_TYPES = ["cash", "cheque", "interbank", "postal_order"]
  PAYMENT_CASH          = PAYMENT_TYPES[0]
  PAYMENT_CHEQUE        = PAYMENT_TYPES[1]
  PAYMENT_INTERBANK     = PAYMENT_TYPES[2]
  PAYMENT_POSTAL_ORDER  = PAYMENT_TYPES[3]

  belongs_to :book
  belongs_to :loan

  # Validations
  validates_presence_of :book
  validates_presence_of :date
  validates_presence_of :amount
  validates_presence_of :transaction_type
  validates_presence_of :payment_type
  validate :validate_amount


  # Scopes
  default_scope :order => "date"
  scope :payments, :conditions => {:transaction_type => "payment"}
  scope :disbursements, :conditions => {:transaction_type => "disbursement"}
  scope :cash, :conditions => {:payment_type => PAYMENT_CASH}
  scope :bank, :conditions => {:payment_type => [PAYMENT_CHEQUE, PAYMENT_INTERBANK]}

  # Callbacks
  after_initialize do |record|
    record.date ||= Date.today
    record.payment_type ||= PAYMENT_CASH
    record.amount         ||= 0.0
    record.interest       ||= 0.0
    record.principal      ||= 0.0
    record.late_interest  ||= 0.0
    record.permitted_fee  ||= 0.0
  end

  # principal = amount if all other amounts eq zero
  # because amount always should be regular + principal + interest + late_interest + permitted_fee
  before_validation do |record| #:set_principal
    if record[:amount] != 0 && record[:regular] == 0 && record[:principal] == 0 &&
        record[:interest] == 0 && record[:late_interest] == 0 && record[:permitted_fee] == 0
      record[:principal] = record[:amount]
    end
  end

  def validate_amount
    unless amount == (regular + principal + interest + late_interest + permitted_fee)
      errors.add :amount, "#{amount} != #{regular} (regular) + #{principal} (principal) + #{interest} (interest) + #{late_interest} (late_interest) + #{permitted_fee} (permitted_fee)"
    end
  end

  def payment?
    transaction_type == TRANSACTION_PAYMENT
  end

  def receipt?
    transaction_type == TRANSACTION_DISBURSEMENT
  end
  def disbursement?; receipt?; end

  def self.custom_create! options
    self.create! options
  end

  def self.debit! options
    self.custom_create! options.merge(:amount => -(options[:amount]))
  end

  def self.credit! options
    self.custom_create! options
  end

  def self.disbursement! options
    self.debit! options.merge(:transaction_type => TRANSACTION_DISBURSEMENT)
  end
  def self.payment! options
    self.credit! options.merge(:transaction_type => TRANSACTION_PAYMENT)
  end

end
