class Admin::CompanyProfilesController < Admin::BaseController
  inherit_resources
  respond_to :html, :xml, :json
  defaults :resource_class => CompanyProfile, :collection_name => 'company_profiles', :instance_name => 'company_profile'
end
