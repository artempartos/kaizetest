class StoriesController < ApplicationController
  before_filter :correct_user_to_story, :only => [:edit, :update, :destroy]

  def index
    @title = title_translate
    @q = Story.ransack(params[:q])
    @stories = @q.result(:distinct => true).order("id ASC").page(params[:page])

end

  def show
    @story = Story.find(params[:id])
    @story.fire_state_event(params[:event]) if params[:event].present?
    #if ((params[:event]=="start" || params[:event]=="finish")&&performer?(@story))||creator?(@story)
    @title = title_translate
    @comments = @story.comments.order("id DESC").page params[:page]
  end

  def new
    @title = title_translate
    @story = Story.new
  end

  def create
    @story= Story.new(params[:story])
    @story.creator = current_user
    if @story.save
      flash[:success] = flash_translate(:success)
      redirect_to @story
    else
      flash[:error] = flash_translate :error
      render 'new'
    end
  end

  def edit
    @story = Story.find_by_id(params[:id])
    @title = title_translate
  end

  def update
    if @story.update_attributes(params[:story])
      flash[:success] = flash_translate :success
      redirect_to @story
    else
      flash[:error] = flash_translate :error
      @title = title_translate
      render 'edit'
    end
  end

  def destroy
    Story.find(params[:id]).destroy
    flash[:success] =  flash_translate :success
    redirect_to stories_path
  end

end

private

def correct_user_to_story
  @story = Story.find(params[:id])
  redirect_to(root_path,:flash => {:error => flash_translate(:success)}) unless creator?(@story)
end



