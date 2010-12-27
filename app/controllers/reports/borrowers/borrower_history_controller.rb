class Reports::Borrowers::BorrowerHistoryController < ApplicationController
  def show
    @reports_params = Reports::Params.new params[:reports_params], current_user
    @borrower = @reports_params.borrower
    @loans = @borrower.loans.where(:id => current_user.loans)
    @transactions = @loans.map(&:payments).flatten
  end
end
