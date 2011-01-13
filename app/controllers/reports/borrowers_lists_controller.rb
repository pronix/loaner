class Reports::BorrowersListsController < ApplicationController
  def index
    #@loans = Loan.all
    @borrower_loans = BorrowerLoan.all.sort{|a, b| a.loan.account_no <=> b.loan.account_no}
  end

  def alphabet
    @borrower_loans = BorrowerLoan.all.sort{|a, b| a.borrower.name <=> b.borrower.name}
    render :index
  end

  def blacklisted
    @borrower_loans = BorrowerLoan.all.select{|bl| bl.borrower.black_listed}
    render :index
  end
end
