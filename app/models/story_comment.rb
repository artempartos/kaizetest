class StoryComment < ActiveRecord::Base

  attr_accessible :body
  belongs_to :story
  belongs_to :user

  validates :body, :presence => true
  validates :story_id,  :presence => true
  validates :user_id, :presence => true

  end
