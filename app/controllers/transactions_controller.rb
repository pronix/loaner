class TransactionsController < InheritedResources::Base
  respond_to :html, :xml, :json
  belongs_to :loan#, :optional => true

  def create
    @transaction = Transaction.new params[:transaction].merge(:book => parent.book, :loan => parent)
    create! { return_path }
  end

  def update
    update! { return_path }
  end


#  # GET /transactions/receipts
#  def receipts
#    @receipts = Transaction.disbursements
#  end
# 
#  # GET /transactions/payments
#  def payments
#    @payments = Transaction.payments
#  end

  private

  def return_path
    @loan ? edit_loan_path(@loan) : transaction_path(@transaction)
  end
end
