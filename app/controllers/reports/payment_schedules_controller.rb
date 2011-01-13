class Reports::PaymentSchedulesController < ApplicationController
  def index
    @loans = ::Loan.all
  end

  def show
    @loan = ::Loan.find(params[:id])
  end
end
