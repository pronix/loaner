class Reports::Borrowers::HomeController < ApplicationController
  def index
    @reports_params = Reports::Params.new((params[:report]||{}))
  end
end
