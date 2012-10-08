class StoryComment < ActiveRecord::Base
  attr_accessible :body, :story_id, :user_id
end
