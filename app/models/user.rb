# == Schema Information
#
# Table name: users
#
#  id                 :integer         not null, primary key
#  company_profile_id :integer
#  username           :string(255)
#  email              :string(255)
#  crypted_password   :string(255)
#  password_salt      :string(255)
#  persistence_token  :string(255)
#  name               :string(255)
#  created_at         :datetime
#  updated_at         :datetime
#

class User < ActiveRecord::Base
  acts_as_authentic
  acts_as_authorization_subject  :association_name => :roles
  has_many :books, :foreign_key => :lender_id
  has_many :loans, :through => :books
  has_many :transactions, :through => :books
  belongs_to :company_profile

  include DefaultPeriod

  def transactions
    Transaction.where :loan_id => loans
  end

  def borrowers
    bl = BorrowerLoan.where(:loan_id => loans)
    Person.where(:id => bl.map(&:borrower_id))
  end

  def sureties
    sl = SuretyLoan.where(:loan_id => loans)
    Person.where(:id => sl.map(&:surety_id))
  end

  def balance_at date = default_to
    books.map{|b| b.balance_at date}.sum
  end

  def payments_sum options = {}
    books.map{|b| b.payments(options).sum(:amount)}.sum
  end

  def disbursements_sum options = {}
    books.map{|b| b.disbursements(options).sum(:amount)}.sum
  end

  def principal_sum options = {}
    books.map{|b| b.principal_sum(options)}.sum
  end

  def interest_sum options = {}
    books.map{|b| b.interest_sum(options)}.sum
  end

  def admin?
    false
  end

end
