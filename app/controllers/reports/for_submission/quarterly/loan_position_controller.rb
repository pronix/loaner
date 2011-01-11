class Reports::ForSubmission::Quarterly::LoanPositionController < Reports::BaseController
  def index
    @reports_params = Reports::Params.new((params[:report]||{}), current_user)
  end

  def create
    show
    render :show
  end

  def show
    @reports_params = Reports::Params.new params[:reports_params], current_user
    @reports_params.date_start = Time.local(@reports_params.date_start.year)
    logger.debug @reports_params.date_start += @reports_params.quarter2months
    logger.debug @reports_params.date_end = @reports_params.date_start + 3.months
  end
end
