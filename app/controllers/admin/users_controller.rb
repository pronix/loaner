class Admin::UsersController < Admin::BaseController
  inherit_resources
  respond_to :html, :xml, :json
end
