class Book < ActiveRecord::Base
  belongs_to :lender, :class_name => "User"
  has_many  :loans
  has_many :transactions, :through => :loans

end
