class Activity < ActiveRecord::Base
  attr_accessible :name, :description, :created_at

  validates_presence_of :name
  validates_length_of :description, minimum: 10, message: "Please provide a description of atleast 10 characters, thanks!"

  def self.old_activities
    where({:name => "A name"})
  end

  def self.reverse_alphabetical_order
    order("name DESC")
  end

  def loud_name
    name.upcase
  end
end
