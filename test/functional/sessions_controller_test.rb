require 'test_helper'

class SessionsControllerTest < ActionController::TestCase
  def setup
    @user = create :user
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should not session create" do
    attrs = attributes_for(:user)
    post :create, :session => attrs
    assert !signed_in?
  end

  test "should create session" do
    attrs = {:email => @user.email, :password => @user.password}
    post :create, :session => attrs
    assert_response :redirect
    assert signed_in?
  end

  test "should delete session" do
    attrs = {id: @user.id}
    sign_in @user
    delete :destroy, attrs
    assert_response :redirect
    assert !signed_in?
  end



end
