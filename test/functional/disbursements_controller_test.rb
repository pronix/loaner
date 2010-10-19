require 'test_helper'

class DisbursementsControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_template 'index'
  end
  
  def test_show
    get :show, :id => Disbursement.first
    assert_template 'show'
  end
  
  def test_new
    get :new
    assert_template 'new'
  end
  
  def test_create_invalid
    Disbursement.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end

  def test_create_valid
    Disbursement.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to disbursement_url(assigns(:disbursement))
  end
  
  def test_edit
    get :edit, :id => Disbursement.first
    assert_template 'edit'
  end
  
  def test_update_invalid
    Disbursement.any_instance.stubs(:valid?).returns(false)
    put :update, :id => Disbursement.first
    assert_template 'edit'
  end

  def test_update_valid
    Disbursement.any_instance.stubs(:valid?).returns(true)
    put :update, :id => Disbursement.first
    assert_redirected_to disbursement_url(assigns(:disbursement))
  end
  
  def test_destroy
    disbursement = Disbursement.first
    delete :destroy, :id => disbursement
    assert_redirected_to disbursements_url
    assert !Disbursement.exists?(disbursement.id)
  end
end
