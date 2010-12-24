class LoansController < ApplicationController
  inherit_resources
  respond_to :html, :xml, :json

  def create
    create! { loans_path }
  end
  def update
    update! { edit_loan_path(resource) }
  end

  private

  def collection
    @loans ||= current_user.books.map(&:loans).flatten
  end
end
