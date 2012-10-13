class StoryComment < ActiveRecord::Base
  attr_accessible :body
  belongs_to :story
  belongs_to :user

  validates :body, :presence => true
  validates :story_id,  :presence => true
  validates :user_id, :presence => true
  StoryComment.per_page= 10

  default_scope :order => 'story_comments.created_at DESC'

end
