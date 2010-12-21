class CompanyTransactionsController < ApplicationController
  def index
    @transactions = current_user.transactions
  end

  def payments
    @transactions = current_user.transactions.payments
  end

  def receipts
    @transactions = current_user.transactions.disbursements
  end

end
