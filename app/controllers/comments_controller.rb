class CommentsController < ApplicationController

  before_filter :authenticate, :only => [:create, :destroy]

  def create
    @story = Story.find(params[:story_id])
    @comment = @story.comments.build(params[:comment])
    @comment.user = current_user
    @comment.save  ?   flash[:success] = flash_translate(:success) :  flash[:error] = flash_translate(:error)
    redirect_to story_path @story
  end

  def destroy
    @story = Story.find(params[:story_id])
    @comment = current_user.comments.find_by_id(params[:id])
    if @comment.present?
      @comment.destroy
      redirect_to story_path(@story)
    else
      redirect_to root_path
    end
  end

end
