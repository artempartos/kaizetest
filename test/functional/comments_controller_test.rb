require 'test_helper'

class CommentsControllerTest < ActionController::TestCase

  def setup
    @user = create :user
    @story = create :story
    @comment = @user.comments.new
    @comment.body = "My test body"
    @comment.story = @story

    @attrs = {:body => @comment.body}
  end

  test "should not create comment (user unsigned)" do
    post :create, story_id: @story, comment: @attrs
    assert_response :redirect
    assert_nil Comment.find_by_body(@comment.body)
  end

  test "should create comment" do
    sign_in @user
    post :create, story_id: @story, comment: @attrs
    assert_response :redirect
    assert_not_nil Comment.find_by_body(@comment.body)
  end

  test "should not destroy comment (user unsigned)" do
    @comment.save
    attrs = {story_id: @story, :id => @comment.id}
    delete :destroy, attrs
    assert_response :redirect
    assert_not_nil Comment.find_by_id([@comment.id])
  end

  test "should destroy comment" do
    @comment.save
    sign_in @user
    attrs = {story_id: @story, :id => @comment.id}
    delete :destroy, attrs
    assert_response :redirect
    assert_nil Comment.find_by_id([@comment.id])
  end

end
