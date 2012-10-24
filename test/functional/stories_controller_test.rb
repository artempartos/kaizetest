require 'test_helper'

class StoriesControllerTest < ActionController::TestCase

  def setup
    @user = create :user
    @unsign_user = create :user
    sign_in @user
    @story = create(:story, creator: @user, performer: @user)
    @example_story = attributes_for(:story, performer_id: @user.id)
  end

  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get show" do
    get :show, id: @story.id, event: :start
    assert_response :success
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should edit story" do
    get :edit, id: @story.id
    assert_response :success
  end

  test "should create story" do
    post :create, story: @example_story
    assert_response :redirect
    story = Story.find_by_title @example_story[:title]
    assert_not_nil story
  end

  test "should update story" do
    put :update, id: @story.id,story: @example_story
    story = Story.find_by_title @example_story[:title]
    assert_not_nil story
  end

  test "should not update story" do
    sign_out
    sign_in @unsign_user
    put :update, id: @story.id,story: @example_story
    story = Story.find_by_title @example_story[:title]
    assert_nil story
  end

  test "should destroy story" do
    delete :destroy, id: @story.id
    story = Story.find_by_title @story.title
    assert_nil story
  end

  test "should not destroy story" do
    sign_out
    sign_in @unsign_user
    delete :destroy, id: @story.id
    story = Story.find_by_title @story.title
    assert_not_nil story
  end

end
