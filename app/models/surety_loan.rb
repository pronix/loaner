# == Schema Information
#
# Table name: surety_loans
#
#  id         :integer         not null, primary key
#  surety_id  :integer         not null
#  loan_id    :integer         not null
#  created_at :datetime
#  updated_at :datetime
#

class SuretyLoan < ActiveRecord::Base
  belongs_to :surety, :class_name => "Person"
  belongs_to :loan
end
