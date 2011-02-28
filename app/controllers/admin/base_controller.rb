class Admin::BaseController < ApplicationController
  access_control do
    allow :admin
  end
end
