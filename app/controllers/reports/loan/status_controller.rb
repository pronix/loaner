class Reports::Loan::StatusController < ApplicationController
  def active
    @loans = current_user.loans.where("state != ?", "closed")
    render :show
  end

  def closed
    @loans = current_user.loans.where("state = ?", "closed")
    render :show
  end

  def show
    @loans = current_user.loans
  end
end
