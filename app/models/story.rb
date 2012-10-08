class Story < ActiveRecord::Base
  attr_accessible :deadline, :description, :performer_id, :state, :title
end
