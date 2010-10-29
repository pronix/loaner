class CompanyConfigurationsController < InheritedResources::Base
  respond_to :html, :xml, :json
  defaults :resource_class => Document, :collection_name => 'documents', :instance_name => 'document'
end
