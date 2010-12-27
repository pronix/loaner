class Reports::ForRecords::HomeController < ApplicationController
  def index
    @reports_params = Reports::Params.new((params[:report]||{}), current_user)
  end
end
