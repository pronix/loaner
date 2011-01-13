class Reports::PaymentDue::CalendarViewController < ApplicationController
  def create
    show
    render :show
  end

  def show
    @reports_params = Reports::Params.new params[:reports_params], current_user
  end
end
