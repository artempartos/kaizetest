class StoriesController < ApplicationController
  before_filter :correct_user_to_story, :only => [:edit, :update, :destroy]

  def index
    @title = "Stories"
    @q = Story.search(params[:q])
    @stories = @q.result(:distinct => true).paginate(:page => params[:page],:per_page => 10,:order => "id ASC")

end

  def show
    @story = Story.find(params[:id])
    @story.fire_state_event(params[:event]) if params[:event].present?
      #if ((params[:event]=="start" || params[:event]=="finish")&&performer?(@story))||creator?(@story)
    @title = @story.title
    @comments = @story.comments.paginate(:page => params[:page],:order => "id DESC") #для отображения существующих комментариев
    #current_st (@story) #Сохранение story_id в сессию (поскольку пока не знаю как делать вложенные ресурсы - на дедлайне этого нет, оставил на потом)
  end

  def new
    @title = "Home"
    @story = Story.new
  end

  def create
    @story= Story.new(params[:story])
    @story.creator = current_user
    if @story.save
      flash[:success] = "Story was created!"
      redirect_to @story
    else
      flash[:error] = "Something went wrong!"
      render 'new'
    end
  end

  def edit
    @story = Story.find(params[:id])
    @title = @story.title
  end

  def update
    if @story.update_attributes(params[:story])
      flash[:success] = "Story updated."
      redirect_to @story
    else
      flash[:error] = "Error"
      @title = "Edit story"
      render 'edit'
    end
  end

  def destroy
    Story.find(params[:id]).destroy
    flash[:success] = "Story destroyed."
    redirect_to stories_path
  end

end

private

def correct_user_to_story
  @story = Story.find(params[:id])
  redirect_to(root_path,:flash => {:error => "Access denied"}) unless creator?(@story)
end



