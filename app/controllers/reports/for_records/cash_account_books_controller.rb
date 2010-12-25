class Reports::ForRecords::CashAccountBooksController < Reports::BaseController
  def create
    show
  end

  def show
    @reports_params = Reports::Params.new params[:reports_params]
    @transactions = @reports_params.book.transactions.where(["date >= ? AND date < ?", @reports_params.date_start, @reports_params.date_end])
  end
end
