class Reports::PaymentDue::DailyController < Reports::BaseController
  def create
    show
    render :show
  end

  def show
    @reports_params = Reports::Params.new params[:reports_params], current_user
    @transactions = current_user.transactions.payments.where(["date >= ? AND date < ?", @reports_params.date_start, @reports_params.date_end])
  end
end
