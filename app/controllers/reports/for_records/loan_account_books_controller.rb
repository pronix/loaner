class Reports::ForRecords::LoanAccountBooksController < ApplicationController
  def show
    @reports_params = Reports::Params.new params[:reports_params], current_user
    @loan = @reports_params.loan
    @transactions = @loan.payments
  end
end
