class TransactionsController < ApplicationController

  def index

  end

  # GET /transactions/receipts
  def receipts
  end

  # GET /transactions/payments
  def payments
    @payments = Payment.all
  end
end
