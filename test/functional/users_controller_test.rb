require 'test_helper'

class UsersControllerTest < ActionController::TestCase
  def setup
    @user = create :user
    @attrs = {id: @user.id}
    @example_user = attributes_for :user
  end

  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should not get edit" do
    get :edit, @attrs
    assert_response :redirect
  end

  test "should get edit" do
    sign_in @user
    get :edit, @attrs
    assert_response :success
  end

  test "should create user" do
    post :create, user: @example_user
    assert_response :redirect
    assert_not_nil User.find_by_email @example_user[:email]
  end

  test "should update user" do
    sign_in @user
    put :update, id: @user.id,user: @example_user
    assert_response :redirect
    assert_not_nil User.find_by_email @example_user[:email]
  end

  test "should not update user" do
    put :update, id: @user.id,user: @example_user
    assert_nil User.find_by_email @example_user[:email]
  end

  test "should get show" do
    sign_in @user
    get :show, @attrs
    assert_response :success
  end

  test "should not get show" do
    get :edit, @attrs
    assert_response :redirect
  end

end
