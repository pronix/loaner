class CompanyProfilesController < ApplicationController
  def index
    show
    render :show
  end

  def show
    @company_profile = CompanyProfile.first
  end

  def edit
    @company_profile = CompanyProfile.first
  end

  def update
    @company_profile = CompanyProfile.first
    @company_profile.update_attributes params[:company_profile]
    if @company_profile.save
      flash[:notice] = "Profile updated successfuly"
    end
    render :show
  end
end
