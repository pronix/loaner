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
    amount = params[:amount]
    interest = params[:interest]
    terms = params[:terms]
    @schedule = Loan.calculate_payment_schedule amount.to_i, interest.to_i, terms.to_i
    render :layout => false
  end

  private

  def collection
    @loans ||= current_user.books.map(&:loans).flatten
  end
end
