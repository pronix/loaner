class Reports::ForSubmission::HomeController < Reports::BaseController
  def index
    @reports_params = Reports::Params.new((params[:report]||{}), current_user)
  end
end
