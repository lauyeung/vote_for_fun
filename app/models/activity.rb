class Activity < ActiveRecord::Base
  attr_accessible :description

  validates_length_of :description, minimum: 10, message: "Give me moar!"
end
