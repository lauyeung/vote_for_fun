require 'spec_helper'

describe Activity do
 
 it "requires a description field" do
  activity = Activity.create(name: "big catch woo woo")
  expect(activity).to be_invalid
  activity.description = "fishing trip"
  expect(activity).to be_valid
 end

 it "requires a name field" do
  activity = Activity.create(description: "jetskis and segways")
  expect(activity).to be_invalid
  activity.name = "surf and turf"
  expect(activity).to be_valid
 end

 it "uses properly formatted error messages" do
  activity = Activity.create(description: "shorty")
  activity.valid?
  proper_message = "Please provide a description of atleast 10 characters, thanks!"
  expect(activity.errors.messages[:description]).to include(proper_message)
 end

 it "returns the activity name in ALL CAPS" do
  name = "pizza party"
  activity = Activity.create({name: name, description: "fun times woo woo"})
  expect(activity.loud_name).to eql(name.upcase)
 end

 it "returns old activities" do
  old_activity1 = Activity.create({created_at: Time.now - 3.years, name: "A name", description: "fun times woo woo"})
  old_activity2 = Activity.create({created_at: Time.now - 2.years, name: "A name", description: "fun times woo woo"})
  new_activity = Activity.create({name: "L name", description: "fun times woo woo"})
  expect(Activity.old_activities).to include old_activity1
  expect(Activity.old_activities.length).to eql(2)
  expect(Activity.old_activities).not_to include new_activity
 end

 it "returns the activities in reverse alphabetical order by name" do
  activity1 = Activity.create({name: "A name", description: "fun times woo woo"})
  activity2 = Activity.create({name: "Z name", description: "fun times woo woo"})
  activity3 = Activity.create({name: "L name", description: "fun times woo woo"})
  expect(Activity.reverse_alphabetical_order.first).to eql(activity2)
 end
end
