# == Schema Information
#
# Table name: payments
#
#  id         :integer         not null, primary key
#  loan_id    :integer         not null
#  amount     :float           default(0.0), not null
#  paid_on    :date
#  remarks    :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class Payment < ActiveRecord::Base
  default_scope :order => :paid_on
  belongs_to :loan
  validates_associated :loan
end
