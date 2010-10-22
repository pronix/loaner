class CalculatorsController < ApplicationController

  def show
    @calculator = Calculator.new
  end

  def calculate
    @calculator = Calculator.new params[:calculator]
    @result = @calculator.calculate
    render :show
  end
end
