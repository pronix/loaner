class BorrowerLoan < ActiveRecord::Base
  belongs_to :person
  belongs_to :loan
end
