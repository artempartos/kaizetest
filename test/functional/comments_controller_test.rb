require 'test_helper'

class CommentsControllerTest < ActionController::TestCase

  def setup
    @user = create :user
    @story = create(:story, creator: @user, performer: @user)
  end

  test "should not create comment (user unsigned)" do
    @comment = attributes_for(:comment)
    post :create, story_id: @story, comment: @comment
    assert_response :redirect
    comment = Comment.find_by_body(@comment[:body])
    assert_nil comment
  end

  test "should create comment" do
    @comment = attributes_for(:comment)
    sign_in @user
    post :create, story_id: @story, comment: @comment
    assert_response :redirect
    comment = Comment.find_by_body(@comment[:body])
    assert_not_nil comment
  end

  test "should not destroy comment (user unsigned)" do
    @comment = create(:comment, story: @story, user: @user)
    attrs = {story_id: @story, :id => @comment.id}
    delete :destroy, attrs
    assert_response :redirect
    comment = Comment.find_by_id([@comment.id])
    assert_not_nil comment
  end

  test "should destroy comment" do
    @comment = create(:comment, story: @story, user: @user)
    sign_in @user
    attrs = {story_id: @story, :id => @comment.id}
    delete :destroy, attrs
    assert_response :redirect
    comment = Comment.find_by_id([@comment.id])
    assert_nil comment
  end

end
