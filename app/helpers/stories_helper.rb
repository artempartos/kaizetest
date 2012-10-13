module StoriesHelper
include SessionsHelper
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

end

