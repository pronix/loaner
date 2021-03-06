class LoansController < ApplicationController
  inherit_resources
  respond_to :html, :xml, :json

  def create
    create! { loans_path }
  end
  def update
    update! { edit_loan_path(resource) }
  end

  def calculate_payment_schedule
    @loan = Loan.new params[:loan]
    @schedule = @loan.calculate_payment_schedule
    render :layout => false
  end

  private

  def collection
    @loans ||= current_user.books.map(&:loans).flatten
  end
end
