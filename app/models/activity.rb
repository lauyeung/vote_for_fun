class Activity < ActiveRecord::Base
  attr_accessible :description, :created_at

  validates_length_of :description, minimum: 10, message: "Give me moar!"

  def self.old_activities
    where({})
  end

  def self.reverse_alphabetical_order
    order({})
  end
end
