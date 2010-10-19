require 'test_helper'

class LoansControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_template 'index'
  end
  
  def test_show
    get :show, :id => Loan.first
    assert_template 'show'
  end
  
  def test_new
    get :new
    assert_template 'new'
  end
  
  def test_create_invalid
    Loan.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end

  def test_create_valid
    Loan.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to loan_url(assigns(:loan))
  end
  
  def test_edit
    get :edit, :id => Loan.first
    assert_template 'edit'
  end
  
  def test_update_invalid
    Loan.any_instance.stubs(:valid?).returns(false)
    put :update, :id => Loan.first
    assert_template 'edit'
  end

  def test_update_valid
    Loan.any_instance.stubs(:valid?).returns(true)
    put :update, :id => Loan.first
    assert_redirected_to loan_url(assigns(:loan))
  end
  
  def test_destroy
    loan = Loan.first
    delete :destroy, :id => loan
    assert_redirected_to loans_url
    assert !Loan.exists?(loan.id)
  end
end
