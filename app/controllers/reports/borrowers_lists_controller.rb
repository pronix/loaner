class Reports::BorrowersListsController < ApplicationController
  def index
    #@loans = Loan.all
    @borrower_loans = BorrowerLoan.all.sort{|a, b| a.loan.account_no <=> b.loan.account_no}
  end
end
