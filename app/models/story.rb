class Story < ActiveRecord::Base
  attr_accessible :deadline, :description, :performer_id, :title, :creator_id
  #attr_accessor :state
  belongs_to :creator, :class_name => "User", :foreign_key => :creator_id, :inverse_of => :stories
  belongs_to :performer, :class_name => "User", :foreign_key => :performer_id
  has_many :story_comments

  validates :title, :presence => true
  validates :description,  :presence => true
  validates :creator_id, :presence => true
  validates :performer_id, :presence => true
  Story.per_page= 10
    state_machine :state, :initial => :new do

    event :start do
      transition [:rejected, :new] => :started
     end

    event :finish do
      transition :started => :finished
    end

    event :accept do
      transition :finished => :accepted
    end

    event :reject do
      transition :finished => :rejected
    end

  end

end
