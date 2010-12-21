# == Schema Information
#
# Table name: books
#
#  id         :integer         not null, primary key
#  lender_id  :integer         not null
#  name       :string(255)
#  balance    :float           default(0.0), not null
#  created_at :datetime
#  updated_at :datetime
#

class Book < ActiveRecord::Base
  belongs_to :lender, :class_name => "User"
  has_many  :loans
  has_many :transactions, :through => :loans
end
