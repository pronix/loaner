class DisbursementsController < ApplicationController
  def index
    @disbursements = Disbursement.all
  end
  
  def show
    @disbursement = Disbursement.find(params[:id])
  end
  
  def new
    @disbursement = Disbursement.new
  end
  
  def create
    @disbursement = Disbursement.new(params[:disbursement])
    if @disbursement.save
      flash[:notice] = "Successfully created disbursement."
      redirect_to @disbursement
    else
      render :action => 'new'
    end
  end
  
  def edit
    @disbursement = Disbursement.find(params[:id])
  end
  
  def update
    @disbursement = Disbursement.find(params[:id])
    if @disbursement.update_attributes(params[:disbursement])
      flash[:notice] = "Successfully updated disbursement."
      redirect_to @disbursement
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @disbursement = Disbursement.find(params[:id])
    @disbursement.destroy
    flash[:notice] = "Successfully destroyed disbursement."
    redirect_to disbursements_url
  end
end
