require 'test_helper'

class WelcomeControllerTest < ActionController::TestCase

  def setup
    @user = create :user
    sign_in @user
    #@story = create :story
    #@story2 = create :story
    #@story.creator = @user
    #@story2.performer = @user
  end

  test "should get index" do
    get :index
    assert_response :success
  end
end
