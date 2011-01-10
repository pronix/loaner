class Reports::ForSubmission::Quarterly::LoanPositionController < Reports::BaseController
  def index
    @reports_params = Reports::Params.new((params[:report]||{}), current_user)
  end

  def create
    show
    render :show
  end

  def show
    #@reports_params = Reports::Params.new params[:reports_params], current_user
    #@transactions = @reports_params.book.transactions.where(["date >= ? AND date < ?", @reports_params.date_start, @reports_params.date_end])
  end
end
