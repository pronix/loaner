# == Schema Information
#
# Table name: people
#
#  id                 :integer         not null, primary key
#  user_id            :integer
#  name               :string(255)
#  birth_at           :date
#  citizenship        :string(255)
#  designation        :text
#  mail_address       :text
#  business_address   :text
#  business_phone     :string(255)
#  home_phone         :string(255)
#  hand_phone         :string(255)
#  email              :string(255)
#  identification_no  :string(255)
#  annual_income      :integer
#  photo_file_name    :string(255)
#  photo_content_type :string(255)
#  photo_file_size    :integer
#  photo_updated_at   :datetime
#  created_at         :datetime
#  updated_at         :datetime
#

class Person < ActiveRecord::Base
  belongs_to :users
  #has_many :lender_loans, :class_name => 'Loan', :foreign_key => :lender_id
  has_many :surety_loans
  has_many :borrower_loans, :foreign_key => :borrower_id
  has_many :loans, :through => :borrower_loans

  validates_presence_of :name

  has_attached_file :photo, :styles => { :icon => "32x32#", :thumb => "200x200>" }

  before_destroy do |record|
    if BorrowerLoan.find_by_borrower_id(record) || SuretyLoan.find_by_surety_id(record) || Loan.find_by_lender_id(record)
      record.errors.add :base, "Cant delete this Person"
      logger.debug "person has relations"
      false
    end
  end
end
