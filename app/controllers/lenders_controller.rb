class LendersController < InheritedResources::Base
  respond_to :html, :xml, :json

  defaults :resource_class => User, :collection_name => 'lenders', :instance_name => 'lender'

  def create
    create! { lenders_path }
  end

  def update
    update! { edit_lender_path(resource) }
  end

end
