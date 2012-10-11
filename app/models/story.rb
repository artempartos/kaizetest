class Story < ActiveRecord::Base
  attr_accessible :deadline, :description, :performer_id, :title, :creator_id
  belongs_to :creator, :class_name => "User", :foreign_key => :creator_id, :inverse_of => :stories
  has_one :performer, :class_name => "User", :foreign_key => :performer_id

    state_machine :state, :initial => :new do
    #before_transition :parked => any - :parked, :do => :put_on_seatbelt
    #after_transition :on => :crash, :do => :tow
    #after_transition :on => :repair, :do => :fix
    #after_transition any => :parked do |vehicle, transition|
    #  vehicle.seatbelt_on = false
    #end

    event :start do
      transition [:rejected, :new] => :started,
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

    #state all - [:parked, :stalled, :idling] do
    #  def moving?
    #    true
    #  end
    #end

  end

end
