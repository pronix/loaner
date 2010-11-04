class Book < ActiveRecord::Base
  belongs_to :lender, :class_name => "User"
  has_many  :loans
end
