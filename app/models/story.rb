class Story < ActiveRecord::Base
  attr_accessible :deadline, :description, :performer_id, :title, :creator_id
  attr_accessor :state_changer
  belongs_to :creator, :class_name => "User"#, :foreign_key => :creator_id
  belongs_to :performer, :class_name => "User"#, :foreign_key => :performer_id
  has_many :comments
  validates :title, :presence => true
  validates :description,  :presence => true
  validates :creator, :presence => true
  validates :performer, :presence => true

  state_machine :state, :initial => :new do

    event :start do
      transition [:rejected, :new] => :started, :if => :can_change?
     end

    event :finish do
      transition :started => :finished , :if => :can_change?
    end

    event :accept do
      transition :finished => :accepted , :if => :is_creator?
    end

    event :reject do
      transition :finished => :rejected , :if => :is_creator?
    end

  end

  def is_creator?
    creator.eql?(state_changer)
  end

  def can_change?
    state_changer.in?(creator, performer)
  end

end
