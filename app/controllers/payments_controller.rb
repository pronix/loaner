class PaymentsController < InheritedResources::Base
  respond_to :html, :xml, :json
  belongs_to :loan

  def create
    create! { edit_loan_path(@loan) }
  end

end
