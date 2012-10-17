module AccessHelper
include AuthHelper
  def creator?(story)
    current_user.id==story.creator_id
  end

def performer?(story)
  current_user.id==story.performer_id
end

def current_st(story)
  session[:story_id] = story.id
end

def current_story
  @current_story ||= Story.find(session[:story_id]) if session[:story_id]
end

def authorized_user
  @comment = current_user.story_comments.find_by_id(params[:id])
  redirect_to root_path if @comment.nil?
end

end

