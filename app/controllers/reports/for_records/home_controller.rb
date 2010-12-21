class Reports::ForRecords::HomeController < ApplicationController
  def index
    @report_params = Reports::Params.new((params[:report]||{}))
  end
end
