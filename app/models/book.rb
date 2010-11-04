class Book < ActiveRecord::Base
  belongs_to :lender
  has_many  :transactions
end
