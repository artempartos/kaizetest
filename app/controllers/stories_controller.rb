class StoriesController < ApplicationController
  include StoriesHelper
  #render :nothing => true
  #layout "layouts stories"
  before_filter :correct_user_to_story, :only => [:edit, :update, :destroy]
  before_filter :filter, :only => [:index]

  @@state_filter = nil
  @@user_filter = nil

  def index
    @title = "Stories"

  end

  def show
    @story = Story.find(params[:id])
    @title = @story.title
    @story_comment = @story.story_comments.new
    @comments = @story.story_comments.paginate(:page => params[:page])

    current_st (@story)
  end

  def new
    @title = "Home"
    @story = Story.new
  end

  def create
    @story= Story.new(params[:story])
    @story.creator_id = current_user.id
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

  def do
    @story = Story.find(params[:id])
    event = params[:event]
    if ((event=="start" || event=="finish")&&performer?(@story))||creator?(@story)
    @story.fire_state_event(event)
    end
    redirect_to story_path(@story)
    #render 'show'

    #
  end

  def filter


    if !params.nil? && !params[:filter].nil?

      params[:filter][:state].empty? ? @@state_filter = nil : @@state_filter = params[:filter][:state]

      params[:filter][:user].empty? ? @@user_filter = nil : @@user_filter = params[:filter][:user]

    end


    @stories = Story.paginate(:page => params[:page],:order => "id ASC") if request.fullpath.include? stories_path
    if @@user_filter && @@state_filter
      @stories = Story.where("stories.state = ? AND (stories.creator_id = (select users.id from users where users.name = ?) OR stories.performer_id = (select users.id from users where users.name = ?))", @@state_filter,@@user_filter,@@user_filter).paginate(:page => params[:page],:order => "id ASC") if request.fullpath.include? stories_filter_path
    elsif @@user_filter
      @stories = Story.where("stories.creator_id = (select users.id from users where users.name = ?) OR stories.performer_id = (select users.id from users where users.name = ?)", @@user_filter,@@user_filter).paginate(:page => params[:page],:order => "id ASC") if request.fullpath.include? stories_filter_path
    elsif @@state_filter
      @stories = Story.where("stories.state = ?", @@state_filter).paginate(:page => params[:page],:order => "id ASC") if request.fullpath.include? stories_filter_path
    end

    render 'index'
  end

end




private


def correct_user_to_story
  @story = Story.find(params[:id])
  redirect_to(root_path,:flash => {:error => "Access denied"}) unless creator?(@story)
end



