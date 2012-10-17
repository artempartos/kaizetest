class StoryCommentsController < ApplicationController
  include AccessHelper
  before_filter :authenticate, :only => [:create, :destroy]
  before_filter :authorized_user, :only => :destroy

  def create

    @story_comment = current_user.story_comments.build(params[:story_comment])

    @story_comment.story = current_story

    if @story_comment.save
      flash[:success] = "Comment created!"
      redirect_to story_path current_story
    else
      flash[:error] = "Failed!"
      redirect_to story_path current_story
    end

  end

  def destroy

    story = @comment.story
    @comment.destroy
    redirect_back_or story_path(story)

  end

end
