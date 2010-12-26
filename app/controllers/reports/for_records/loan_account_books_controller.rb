class Reports::ForRecords::LoanAccountBooksController < ApplicationController
  def show
    @reports_params = Reports::Params.new params[:reports_params]
    @loan = @reports_params.loan
    @transactions = @loan.payments
  end
end
