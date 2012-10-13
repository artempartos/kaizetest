class StoryCommentsController < ApplicationController
  include StoriesHelper
  before_filter :authenticate, :only => [:create, :destroy]
  before_filter :authorized_user, :only => :destroy

  def create
    @story_comment = current_user.story_comments.build(params["story_comment"])
    @st = current_story
    p @st
    @story_comment.story=@st
    p @story_comment
    if @story_comment.save
      flash[:success] = "Comment created!"
      redirect_to story_path(@st)
    else
      flash[:error] = "Failed!"
      redirect_to story_path(@st)
    end
  end

  def destroy
    story = @comment.story
    @comment.destroy
    redirect_back_or story_path(story)
  end

  private

  def authorized_user
    @comment = current_user.story_comments.find_by_id(params[:id])
    redirect_to root_path if @comment.nil?
  end

end
