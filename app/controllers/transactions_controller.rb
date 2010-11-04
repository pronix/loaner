class TransactionsController < InheritedResources::Base
  respond_to :html, :xml, :json
  belongs_to :loan

  def create
    create! { edit_loan_path(@loan) }
  end


  # GET /transactions/receipts
  def receipts
    @receipts = Transaction.disbursements
  end

  # GET /transactions/payments
  def payments
    @payments = Transaction.payments
  end
end
