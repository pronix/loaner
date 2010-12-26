# == Schema Information
#
# Table name: users
#
#  id                :integer         not null, primary key
#  username          :string(255)
#  email             :string(255)
#  crypted_password  :string(255)
#  password_salt     :string(255)
#  persistence_token :string(255)
#  name              :string(255)
#  created_at        :datetime
#  updated_at        :datetime
#

class User < ActiveRecord::Base
  acts_as_authentic
  acts_as_authorization_subject  :association_name => :roles
  has_many :books, :foreign_key => :lender_id
  has_many :loans, :through => :books
  has_many :transactions, :through => :books
  belongs_to :company_profile

  def transactions
    Transaction.where :loan_id => loans
  end

  def admin?

  end
end
