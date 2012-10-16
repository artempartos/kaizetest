require 'test_helper'

class SessionsControllerTest < ActionController::TestCase
  def setup
    @user = create :user
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should post create" do

    attrs = {:email => "123@mail.ru", :password => "123123"}
    post :create, :session => attrs
    assert !signed_in?

    attrs = {:email => @user.email, :password => @user.password}
    post :create, :session => attrs
    assert_response :redirect
    assert signed_in?
  end

  test "should delete destroy" do
    attrs = {id: 1}
    sign_in @user
    delete :destroy, attrs
    assert_response :redirect
    assert !signed_in?
  end



end
