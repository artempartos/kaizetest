class Story < ActiveRecord::Base
  attr_accessible :deadline, :description, :performer_id, :state, :title, :creator_id
  belongs_to :creator, :class_name => "User", :foreign_key => :creator_id
  has_one :performer, :class_name => "User", :foreign_key => :performer_id

end
