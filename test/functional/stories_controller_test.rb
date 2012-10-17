require 'test_helper'

class StoriesControllerTest < ActionController::TestCase

  def setup
    @user = create :user
    @unsign_user = FactoryGirl.build(:user)
    @unsign_user.email = "new@email.com"
    @unsign_user.save
    sign_in @user
    @story = Story.new
    @story.title = "title1"
    @story.description = "description1"
    @story.deadline = '2014-01-01 00:00:00'
    @story.creator = @user
    @story.performer = @user
    @story.save

    @example_story = {title: 'Example Story Title',
                      description: 'Example description',
                      deadline: '2013-01-01 00:00:00',
                      performer_id: @user.id}
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

  test "should create story" do
    post :create, story: @example_story
    assert_response :redirect
    assert_not_nil Story.find_by_title @example_story[:title]
  end

  test "should edit story" do
    get :edit, id: @story.id
    assert_response :success
  end

  test "should update story" do
    put :update, id: @story.id,story: @example_story
    assert_not_nil Story.find_by_title @example_story[:title]
  end

  test "should not update story" do
    sign_out
    sign_in @unsign_user
    put :update, id: @story.id,story: @example_story
    assert_nil Story.find_by_title @example_story[:title]
  end

  test "should destroy story" do
    delete :destroy, id: @story.id
    assert_nil Story.find_by_title @story.title
  end

  test "should not destroy story" do
    sign_out
    sign_in @unsign_user
    delete :destroy, id: @story.id
    assert_not_nil Story.find_by_title @story.title
  end

end
