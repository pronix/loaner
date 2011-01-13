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
    @reports_params.to_quarter!
  end
end
