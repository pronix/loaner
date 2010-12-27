class Reports::Borrowers::BorrowerStatementsController < Reports::BaseController
  def show
    @reports_params = Reports::Params.new params[:reports_params], current_user
    @loan = @reports_params.loan
  end
end
