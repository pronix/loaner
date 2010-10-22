class LoansController < InheritedResources::Base
  respond_to :html, :xml, :json

  def update
    update! { edit_loan_path(resource) }
  end
end
