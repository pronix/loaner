class HomeController < ApplicationController
  def index
    if current_user
      @company_profile = current_user.company_profile
    end
  end
end
