require 'test_helper'

class WelcomeControllerTest < ActionController::TestCase

  def setup
    @user = create :user
    @story = create(:story, creator: @user, performer: @user)
  end

  test "should get index" do
    sign_in @user
    get :index
    assert signed_in?
    assert_response :success
  end
end
