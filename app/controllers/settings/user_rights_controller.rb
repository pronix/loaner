class Settings::UserRightsController < ApplicationController
  def index
    @users = User.all
  end
end
