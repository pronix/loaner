class CompanyTransactionsController < ApplicationController
  def index
    #@loans = current_user.books.map(&:loans)
    #@transactions = @loans.map(&:transactions)
    @transactions = Transaction.all
  end

  def payments
    @transactions = Transaction.payments
  end

  def receipts
    @transactions = Transaction.disbursements
  end

end
