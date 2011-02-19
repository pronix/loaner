class CompanyTransactionsController < InheritedResources::Base
  respond_to :html, :xml, :json

  defaults :resource_class => Transaction, :collection_name => 'transactions', :instance_name => 'transaction'

  def index
    @transactions = current_user.transactions
  end

  def receipts
    @transactions = current_user.transactions.receipts
  end

  def payments
    @transactions = current_user.transactions.payments
  end

  def disbursements
    @transactions = current_user.transactions.disbursements
  end

  def repayments
    @transactions = current_user.transactions.repayments
  end

  def book_transfers
    @transactions = current_user.transactions.book_transfers
  end

  def account_transfers
    @transactions = current_user.transactions.account_transfers
  end
end
