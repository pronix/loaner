class LoansController < InheritedResources::Base
  respond_to :html, :xml, :json

  def create
    create! { loans_path }
  end
  def update
    update! { edit_loan_path(resource) }
  end
end
