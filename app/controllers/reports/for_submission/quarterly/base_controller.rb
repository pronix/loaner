class Reports::ForSubmission::Quarterly::BaseController < Reports::BaseController
  def create
    show
    render :show
  end

  def show
    @reports_params = Reports::Params.new params[:reports_params], current_user
    @reports_params.to_quarter!
  end
end
