class Reports::PaymentDue::AgingController < ApplicationController
  def show
    #@reports_params = Reports::Params.new params[:reports_params], current_user
    @loans = current_user.loans
  end
end
